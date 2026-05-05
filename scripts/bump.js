const fs = require("fs");
const path = require("path");

function bumpPatch() {
  const filePath = path.join(__dirname, "..", "pubspec.yaml");

  fs.readFile(filePath, "utf8", (err, data) => {
    if (err) {
      console.error("Failed to read pubspec.yaml:", err);
      return;
    }

    const versionRegex = /^version:\s*(\d+)\.(\d+)\.(\d+)\+(\d+)/m;
    const match = data.match(versionRegex);

    if (!match) {
      console.error("Version tag not found in pubspec.yaml");
      return;
    }

    const [_, major, minor, patch, build] = match.map(Number);
    const newVersion = `${major}.${minor}.${patch + 1}+${build}`;
    const updatedData = data.replace(versionRegex, `version: ${newVersion}`);

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

bumpPatch();
