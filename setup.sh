#!/usr/bin/env bash#!/usr/bin/env bash
set -euo pipefail

# cspell:words tlsv unmatch

readonly FLUTTER_INSTALL_DIR="${HOME}/flutter"
: "${PUB_CACHE:=${HOME}/.pub-cache}"
readonly LOCAL_BIN_DIR="${HOME}/.local/bin"
readonly FLUTTER_RELEASES_URL="https://storage.googleapis.com/flutter_infra_release/releases"
: "${DEBUG:=0}"

if [[ ${DEBUG} == "1" ]]; then
	set -x
fi

die() {
	echo "ERROR: $*" >&2
	exit 1
}

need_cmd() {
	command -v "$1" >/dev/null 2>&1 || die "'$1' command is required but not found."
}

download() {
	curl --fail --location --silent --show-error \
		--retry 3 --retry-delay 2 \
		--proto '=https' --tlsv1.2 \
		"$1" --output "$2"
}

verify_sha256() {
	local actual_sha
	actual_sha="$(sha256sum "$1" | awk '{print $1}')"
	[[ ${actual_sha} == "$2" ]] || die "SHA-256 mismatch for $1."
}

cleanup() {
	if [[ -n ${TMP_DIR-} && -d ${TMP_DIR} ]]; then
		rm -rf -- "${TMP_DIR}"
	fi
}

for required_cmd in awk basename chmod curl dirname git grep head mkdir mktemp mv python3 rm sha256sum tar touch uname; do
	need_cmd "${required_cmd}"
done
HOST_OS="$(uname -s)"
readonly HOST_OS
[[ ${HOST_OS} == "Linux" ]] || die "This setup script supports Linux containers only."

HOST_ARCH="$(uname -m)"
readonly HOST_ARCH
case "${HOST_ARCH}" in
x86_64 | amd64) FLUTTER_ARCH="x64" ;;
aarch64 | arm64) FLUTTER_ARCH="arm64" ;;
*) die "Unsupported Flutter host architecture: ${HOST_ARCH}" ;;
esac
export FLUTTER_ARCH FLUTTER_RELEASES_URL

TMP_DIR="$(mktemp -d)"
readonly TMP_DIR
trap cleanup EXIT

release_info="$(
	python3 - <<'PY'
import json
import os
import sys
import urllib.request

url = f"{os.environ['FLUTTER_RELEASES_URL']}/releases_linux.json"
with urllib.request.urlopen(url, timeout=30) as response:
    manifest = json.load(response)

stable_hash = manifest["current_release"]["stable"]
current = next((item for item in manifest["releases"] if item.get("hash") == stable_hash), None)
if current is None:
    sys.exit("Current stable Flutter release was not found.")

version = current.get("version")
target_arch = os.environ["FLUTTER_ARCH"]
release = next(
    (
        item
        for item in manifest["releases"]
        if item.get("channel") == "stable"
        and item.get("version") == version
        and (item.get("dart_sdk_arch") or "x64") == target_arch
    ),
    None,
)
if release is None:
    sys.exit(f"No current stable Flutter archive for Linux {target_arch}.")

archive = release.get("archive")
sha256 = release.get("sha256")
if not archive or not sha256:
    sys.exit("Flutter release metadata is incomplete.")
print(f"{version}|{archive}|{sha256}")
PY
)"
IFS='|' read -r FLUTTER_VERSION FLUTTER_ARCHIVE FLUTTER_SHA <<<"${release_info}"
readonly FLUTTER_VERSION FLUTTER_ARCHIVE FLUTTER_SHA

ensure_flutter_git_safe() {
	if ! git config --global --get-all safe.directory 2>/dev/null | grep -Fqx -- "${FLUTTER_INSTALL_DIR}"; then
		git config --global --add safe.directory "${FLUTTER_INSTALL_DIR}"
	fi
}

ensure_flutter_git_safe

FLUTTER_BIN="${FLUTTER_INSTALL_DIR}/bin/flutter"
INSTALLED_VERSION=""
if [[ -x ${FLUTTER_BIN} ]]; then
	INSTALLED_VERSION="$("${FLUTTER_BIN}" --version 2>/dev/null | head -n 1 | awk '{print $2}' || true)"
fi

if [[ ${INSTALLED_VERSION} == "${FLUTTER_VERSION}" ]]; then
	echo "Flutter ${FLUTTER_VERSION} is already installed."
else
	ARCHIVE_PATH="${TMP_DIR}/$(basename "${FLUTTER_ARCHIVE}")"
	echo "Installing latest stable Flutter ${FLUTTER_VERSION}..."
	download "${FLUTTER_RELEASES_URL}/${FLUTTER_ARCHIVE}" "${ARCHIVE_PATH}"
	verify_sha256 "${ARCHIVE_PATH}" "${FLUTTER_SHA}"
	tar -xf "${ARCHIVE_PATH}" -C "${TMP_DIR}"
	[[ -x ${TMP_DIR}/flutter/bin/flutter ]] || die "Extracted Flutter binary is missing."
	mkdir -p "$(dirname "${FLUTTER_INSTALL_DIR}")"
	rm -rf -- "${FLUTTER_INSTALL_DIR}"
	mv "${TMP_DIR}/flutter" "${FLUTTER_INSTALL_DIR}"
fi

FLUTTER_BIN="${FLUTTER_INSTALL_DIR}/bin/flutter"
DART_BIN="${FLUTTER_INSTALL_DIR}/bin/dart"
PROFILE_LINE="export PATH=\"${FLUTTER_INSTALL_DIR}/bin:${PUB_CACHE}/bin:${LOCAL_BIN_DIR}:\$PATH\""
touch "${HOME}/.bashrc"
grep -Fqx -- "${PROFILE_LINE}" "${HOME}/.bashrc" || printf '\n%s\n' "${PROFILE_LINE}" >>"${HOME}/.bashrc"

export PUB_CACHE
export PATH="${FLUTTER_INSTALL_DIR}/bin:${PUB_CACHE}/bin:${LOCAL_BIN_DIR}:${PATH}"

"${FLUTTER_BIN}" --version
"${DART_BIN}" --version
"${FLUTTER_BIN}" precache --linux --web

for package_name in melos merry flutterfire_cli; do
	echo "Activating latest compatible ${package_name}..."
	"${DART_BIN}" pub global activate "${package_name}"
done

echo "Installing the latest Trunk launcher..."
download "https://trunk.io/releases/trunk" "${TMP_DIR}/trunk"
chmod 0755 "${TMP_DIR}/trunk"
mkdir -p "${LOCAL_BIN_DIR}"
mv -f "${TMP_DIR}/trunk" "${LOCAL_BIN_DIR}/trunk"
"${LOCAL_BIN_DIR}/trunk" --version

run_flutter_pub_get() {
	if git ls-files --error-unmatch pubspec.lock >/dev/null 2>&1; then
		"${FLUTTER_BIN}" pub get --enforce-lockfile
	else
		"${FLUTTER_BIN}" pub get
	fi
}

run_flutter_pub_get

echo "Cloud development environment setup is complete."
