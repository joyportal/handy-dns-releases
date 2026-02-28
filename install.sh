#!/usr/bin/env bash
set -euo pipefail

REPO="joyportal/handy-dns-releases"
INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"
BIN_NAME="handy-dns"

OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"
case "$ARCH" in
  x86_64)  ARCH="amd64" ;;
  aarch64|arm64) ARCH="arm64" ;;
  *) echo "Unsupported architecture: $ARCH" >&2; exit 1 ;;
esac

if [ "$OS" != "linux" ] && [ "$OS" != "darwin" ]; then
  echo "Unsupported OS: $OS" >&2
  exit 1
fi

MANIFEST="https://raw.githubusercontent.com/${REPO}/main/latest.json"
echo "Fetching latest version info..."
MANIFEST_JSON="$(curl -fsSL "$MANIFEST")"
VERSION="$(echo "$MANIFEST_JSON" | grep '"version"' | head -1 | sed 's/.*: *"\(.*\)".*/\1/')"
URL="$(echo "$MANIFEST_JSON" | grep "\"${OS}/${ARCH}\"" | head -1 | sed 's/.*: *"\(.*\)".*/\1/')"

if [ -z "$URL" ]; then
  echo "No binary found for ${OS}/${ARCH}" >&2
  exit 1
fi

TMP="$(mktemp)"
echo "Downloading handy-dns ${VERSION} for ${OS}/${ARCH}..."
curl -fsSL -o "$TMP" "$URL"
chmod +x "$TMP"

if [ -w "$INSTALL_DIR" ]; then
  mv "$TMP" "${INSTALL_DIR}/${BIN_NAME}"
else
  sudo mv "$TMP" "${INSTALL_DIR}/${BIN_NAME}"
fi

echo "Installed handy-dns ${VERSION} to ${INSTALL_DIR}/${BIN_NAME}"
