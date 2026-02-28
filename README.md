# Handy DNS Releases

This repository hosts pre-built binaries for [Handy DNS](https://github.com/joyportal/handy-dns) — a local intelligent DNS routing gateway.

## Install

### Linux / macOS

```bash
curl -fsSL https://raw.githubusercontent.com/joyportal/handy-dns-releases/main/install.sh | bash
```

Installs the latest binary to `/usr/local/bin/handy-dns`.

### Custom install directory

```bash
INSTALL_DIR=~/bin curl -fsSL https://raw.githubusercontent.com/joyportal/handy-dns-releases/main/install.sh | bash
```

### Manual download

Download the binary for your platform from [Releases](https://github.com/joyportal/handy-dns-releases/releases/latest).

| Platform      | Binary                          |
|---------------|---------------------------------|
| Linux amd64   | `handy-dns-*-linux-amd64`       |
| Linux arm64   | `handy-dns-*-linux-arm64`       |
| macOS amd64   | `handy-dns-*-darwin-amd64`      |
| macOS arm64   | `handy-dns-*-darwin-arm64`      |
| Windows amd64 | `handy-dns-*-windows-amd64.exe` |
| Windows arm64 | `handy-dns-*-windows-arm64.exe` |

## Usage

```bash
# Run with default config (creates ./data/config.json on first run)
handy-dns

# Custom config path
handy-dns -config /etc/handy-dns/config.json
```

Open the web UI at **http://localhost:8080** (default). DNS server listens on **0.0.0.0:5353**.

## Self-Update

Handy DNS can update itself in-place via the web UI (Settings → Software Update). It fetches `latest.json` from this repo and applies the update atomically.

## License

See [source repository](https://github.com/joyportal/handy-dns).
