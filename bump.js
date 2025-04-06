const fs = require("fs");
const path = require("path");

function bumpPatch() {
  const filePath = path.join(__dirname, "pubspec.yaml");

  // 파일 읽기
  fs.readFile(filePath, "utf8", (err, data) => {
    if (err) {
      console.error("Failed to read pubspec.yaml:", err);
      return;
    }

    // 현재 버전 추출
    const versionRegex = /^version:\s*(\d+)\.(\d+)\.(\d+)\+(\d+)/m;
    const match = data.match(versionRegex);

    if (!match) {
      console.error("Version tag not found in pubspec.yaml");
      return;
    }

    // 버전 파싱
    const [_, major, minor, patch, build] = match.map(Number);

    // 패치 번호와 빌드 번호 증가 (여기서는 patch만 증가)
    const newPatch = patch + 1;
    const newBuild = build;

    const newVersion = `${major}.${minor}.${newPatch}+${newBuild}`;

    // 새 버전으로 업데이트
    const updatedData = data.replace(versionRegex, `version: ${newVersion}`);

    // 파일에 새 데이터 쓰기
    fs.writeFile(filePath, updatedData, "utf8", (error) => {
      if (error) {
        console.error(
          "Failed to write updated version to pubspec.yaml:",
          error,
        );
      } else {
        console.log(`Version updated to ${newVersion}`);
      }
    });
  });
}

// 함수 호출
bumpPatch();
