# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

This is a personal [Yazi](https://github.com/sxyazi/yazi) configuration directory (`~/.config/yazi`). Yazi is a terminal file manager written in Rust, configured via TOML files with optional Lua plugins.

## Config file roles

- **`yazi.toml`** — General settings: panel ratios (`[mgr]`), preview dimensions, opener commands for `edit`/`open`, and custom `prepend_previewers` that pipe through the `piper` plugin (glow for markdown, eza for directories).
- **`keymap.toml`** — Custom keybindings under `[mgr] prepend_keymap`. Includes go-to shortcuts (`g h` → home, `g c` → `~/.config`, `g y` → this dir, `g d` → Downloads, `g v` → `~/Desktop/vestack`), file ops (`o` open, `Y` yank, `X` unyank, `a` create, `R` rename), compression shortcuts (`c a a` / `c a l`), and project manager shortcuts (`P s`/`P l`/`P P`/`P d`/`P D`/`P m`/`P M`).
- **`theme.toml`** — Declares the flavor (theme) to use. Currently set to `tokyo-night` for both dark and light modes.
- **`package.toml`** — Declares plugin and flavor dependencies with pinned revisions and content hashes. Plugins: `KKV9/compress`, `MasouShizuka/projects`, `yazi-rs/plugins:piper`. Flavor: `BennyOe/tokyo-night`.
- **`init.lua`** — Lua plugin initialization. Currently configures the `projects` plugin with auto-save behavior on save/load/quit.

## Flavors

The `flavors/` directory contains Yazi flavor (theme) packages. Each subdirectory is a standalone flavor with:
- `flavor.toml` — Color definitions matching Yazi's flavor schema
- `tmtheme.xml` — TextMate theme for syntax highlighting
- `preview.png` — Preview screenshot
- `LICENSE` / `LICENSE-tmtheme` — Licensing

Local flavors: `catppuccin-latte.yazi`, `catppuccin-frappe.yazi`, `catppuccin-macchiato.yazi`, `catppuccin-mocha.yazi`, `dracula.yazi`, `base16.yazi`.

`flavors/scripts/generate.js` (Node ESM) generates flavor directories from a `template.toml` and hardcoded color palettes. Run with `node flavors/scripts/generate.js` from the repo root. The `flavors/package.json` only sets `"type": "module"`.

## Plugins

The `plugins/` directory contains three community plugins, each structured as a Yazi plugin package with `main.lua`:

- **`compress.yazi`** — Archives selected files. Supports zip, 7z, rar, tar.gz, tar.xz, tar.bz2, tar.zst, tar.lz4, tar.lha, and plain tar. Dispatches to available system tools (zip, 7z, rar, tar/bsdtar). Handles password protection, encryption headers, and compression levels.
- **`projects.yazi`** — Save/restore tab sets as named projects mapped to alphanumeric keys (0-9, A-Z, a-z). Supports merge of projects across Yazi instances via `ps` (pub/sub) events. Stores projects either in Yazi's DDS or as a Lua JSON file.
- **`piper.yazi`** — Passes file content through a shell command for preview. Used by the `prepend_previewers` in `yazi.toml` to render markdown (via glow) and directories (via eza).

## No build/lint/test

There is no build step, linter, or test suite. This repo is a Yazi config directory — changes take effect when Yazi is restarted. Validate TOML syntax by checking that Yazi starts without errors.
