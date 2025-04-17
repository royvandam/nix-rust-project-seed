# Nix + Rust + VSCode project seed 🌱

A minimal Nix flake based Rust project seed with VS Code support.

## Features

- Flake-based `nix develop` shell
- Main binary at `src/bin/app.rs`
- VS Code support via [Workspace Shared Settings extension](https://marketplace.visualstudio.com/items/?itemName=b-shulha.wss)
- `.vscode/settings-helper.sh` provides correct tool paths under nix for VS Code configuration

## Getting Started

Clone and enter the project:

```bash
git clone <your-url> nix-rust-project-seed
cd nix-rust-project-seed
code .
```

## VS Code Setup

1. Open the project in VS Code
2. install the Workspace Shared Settings (wss) extension
3. When prompted (or via Command Palette), initialize settings from project
4. The extension will call .vscode/settings-helper.sh to generate .vscode/settings.json with the right paths
5. ⚠️ Wait for the settings.json file to appear. It can take a bit on first run as Nix downloads the required tooling
6. ✅ Once the file is there, reload the window
7. You're good to go — Rust + Nix integration should now work out of the box