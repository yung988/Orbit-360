#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORKSPACE="$(cd "$SCRIPT_DIR/.." && pwd)"
RESOURCES_DIR="$WORKSPACE/Resources"
TMP_DIR="$WORKSPACE/.ffmpeg-download"

mkdir -p "$RESOURCES_DIR"
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

echo "Downloading static ffmpeg for macOS..."
curl -L "https://evermeet.cx/ffmpeg/getrelease/zip" -o "$TMP_DIR/ffmpeg.zip"

echo "Downloading static ffprobe for macOS..."
curl -L "https://evermeet.cx/ffmpeg/getrelease/ffprobe/zip" -o "$TMP_DIR/ffprobe.zip"

unzip -q "$TMP_DIR/ffmpeg.zip" -d "$TMP_DIR/ffmpeg"
unzip -q "$TMP_DIR/ffprobe.zip" -d "$TMP_DIR/ffprobe"

FFMPEG_BIN="$(find "$TMP_DIR/ffmpeg" -type f -name ffmpeg -perm +111 | head -n 1)"
FFPROBE_BIN="$(find "$TMP_DIR/ffprobe" -type f -name ffprobe -perm +111 | head -n 1)"

if [ -z "$FFMPEG_BIN" ] || [ -z "$FFPROBE_BIN" ]; then
    echo "Failed to find ffmpeg or ffprobe in downloaded archives."
    exit 1
fi

cp "$FFMPEG_BIN" "$RESOURCES_DIR/ffmpeg"
cp "$FFPROBE_BIN" "$RESOURCES_DIR/ffprobe"
chmod +x "$RESOURCES_DIR/ffmpeg" "$RESOURCES_DIR/ffprobe"

rm -rf "$TMP_DIR"

echo "Bundled binaries written to:"
echo "  $RESOURCES_DIR/ffmpeg"
echo "  $RESOURCES_DIR/ffprobe"
