# OpenClaw Windows Desktop App (scaffold)

This folder contains an early Windows desktop companion scaffold for OpenClaw.

## What this scaffold includes

- A lightweight native Windows shell script (`scripts/openclaw-windows.ps1`)
- A default launcher that opens the OpenClaw local Control UI (`http://127.0.0.1:18789`)
- A fallback to the system browser if WinForms desktop APIs are unavailable

## Prerequisites

- Windows 10/11
- PowerShell 5.1+ or PowerShell 7+
- .NET desktop runtime available on the machine

## Run

```powershell
cd apps/windows
pnpm start
```

Optional custom URL:

```powershell
cd apps/windows
pnpm start -- -Url http://127.0.0.1:18789/web
```

## Notes

- This is a bootstrap desktop shell and not yet a full parity replacement for the macOS companion app.
- For full OpenClaw Gateway support today, use the standard Windows/WSL2 setup docs: `docs/platforms/windows.md`.
