# AGENTS.md

This Nixvim configuration provides a modular Neovim environment using the nix-community/nixvim framework and flake-parts for reproducible builds.

## Folder Structure

- `config/` - Modular Nixvim configuration modules
  - `default.nix` - Imports all configuration modules
  - `options.nix` - Nix options for paths (nixosConfigPath, nixvimConfigPath)
  - `editor.nix` - Core editor settings and plugins (comments, autopairs, git)
  - `keymaps.nix` - Keybinding definitions
  - `lsp.nix` - LSP server configurations
  - `format.nix` - Formatters and autoformat commands
  - `ui.nix` - Color scheme and UI plugins
  - Other modules: bufferline, cmp, dap, lint, navigation, treesit, term, obsidian, snacks, codecompanion, copilot, system
- `flake.nix` - Flake definition using flake-parts
- `flake.lock` - Pinned flake inputs

## Core Behaviors & Patterns

Configuration follows Nixvim's module system pattern: each file is a module that accepts `config`, `pkgs`, and `lib` parameters. Keymaps use explicit attribute lists with `key`, `mode`, `options`, and `action` fields; Lua actions use `action.__raw = "function() ... end"`. Plugin configurations use `plugins.<name>.enable = true` with optional `settings` for nested config. User commands (format toggles) are defined in `format.nix` using `userCommands`. Paths are configurable via options in `options.nix`, referenced in keymaps as `${config.nixosConfigPath}` and `${config.nixvimConfigPath}`.

## Conventions

File naming: lowercase with hyphens (`lsp.nix`, `keymaps.nix`). Module exports: attribute sets with optional plugin lists or direct key assignments. Indentation: 2 spaces, consistent throughout Nix expressions. Comments: inline `#` for module organization. Keymap prefixes follow mnemonic patterns: `<leader>f` for find, `<leader>g` for git, `<leader>l` for LSP, `<leader>b` for buffer, `<leader>x` for Trouble. Leader is space (`<leader>` = ` `), local leader is comma (`<localleader>` = `,`).

## Working Agreements

- When adding new config modules, import them in `config/default.nix`
- Use the Nix module pattern: accept `config`, `pkgs`, `lib` as function arguments
- Define new keymap prefixes consistently with existing patterns; add a no-op key at the prefix (e.g., `<leader>p` with action `<nop>`)
- When adding plugins, enable them in `plugins.<name>.enable = true`; use `settings` for configuration that doesn't fit Nixvim's direct options
- For Lua code in Nix, always use `__raw = "function() ... end"` to escape the function body as a string
- Test configuration changes by running `nix flake check` to verify syntax; use `nix run` to launch the editor interactively
- Never commit `result` (the build output directory)
