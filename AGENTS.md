# AGENTS.md

## Quick Start

Essential commands for AI agents working on this project:

```bash
# Verify configuration syntax
nix flake check

# Verify Neovim configuration (catches Lua errors, plugin issues)
nix build
./result/bin/nvim --headless -V1 -c 'lua print("=== MESSAGES ===\n" .. vim.api.nvim_exec2("messages", {output=true}).output)' -c 'qa!' 2>&1

# Launch Neovim with current config
nix run .# -- <file>

# Search for available plugins
rg "plugin-name" references/plugin-list.md

# Lua debugging (when something isn't working)
./result/bin/nvim --headless -V1 -c 'lua print("=== MESSAGES ===\n" .. vim.api.nvim_exec2("messages", {output=true}).output)' -c 'qa!' 2>&1

# Startup time profiling (find slow plugins)
./result/bin/nvim --headless --startuptime /tmp/nvim-startup.log -c 'qa!' && cat /tmp/nvim-startup.log | sort -n -k 2 | head -20
```

## Common Workflows

### Adding a New Plugin
1. Check `references/plugin-list.md` for the module name
2. Add to `config/<module>.nix` or create new file
3. Import in `config/default.nix`
4. Verify: `nix flake check && nix build && ./result/bin/nvim --headless -V1 -c 'lua print("=== MESSAGES ===\n" .. vim.api.nvim_exec2("messages", {output=true}).output)' -c 'qa!' 2>&1`
5. Test by launching: `nix run .# -- test.lua`

### Configuring LSP
1. Server list: `references/lsp-server-list.md`
2. Add server in `config/lsp.nix`: `lsp.servers.<name> = { ... }`
3. Check options: `references/lsp.md`
4. Test: Open a relevant file type

### Debugging Config Errors

#### Quick Diagnostics
1. Run `nix flake check` - shows line and option causing Nix configuration errors
2. Run `nix build && ./result/bin/nvim --headless -V1 -c 'lua print("=== MESSAGES ===\n" .. vim.api.nvim_exec2("messages", {output=true}).output)' -c 'qa!' 2>&1` to catch Lua errors and plugin issues
3. Check `references/lib-helpers.md` for Nix→Lua conversion
4. See "Nix→Lua Translation Common Pitfalls" below for common patterns

#### Lua Debugging Commands

Use these commands to debug Lua configuration, plugin loading, and LSP issues:

```bash
# Basic startup errors (catches early Lua failures)
./result/bin/nvim --headless -c 'qa!' 2>&1

# Startup + Lua messages (check for errors/warnings)
./result/bin/nvim --headless -V1 -c 'lua print("=== MESSAGES ===\n" .. vim.api.nvim_exec2("messages", {output=true}).output)' -c 'qa!' 2>&1

# Verbose startup (V1-V20, higher = more detail)
./result/bin/nvim --headless -V2 -c 'qa!' 2>&1   # script sourcing (shows each file loaded)
./result/bin/nvim --headless -V9 -c 'qa!' 2>&1   # every sourced file + line numbers
./result/bin/nvim --headless -V15 -c 'qa!' 2>&1  # almost everything (very verbose)

# Verbose levels explained:
# -V1 : Neovim messages + basic warnings (cleanest output)
# -V2 : Shows each file being loaded during startup (good for seeing what config is executing)
# -V9 : Shows files + line numbers (best for pinpointing exact error location)
# -V15+: Very detailed, shows almost everything (use for deep debugging)

# Dump verbose log to file (better for high verbosity)
./result/bin/nvim --headless -V9 -c 'writefile(vim.split(execute("messages"), "\n"), "/tmp/nvim-debug.log")' -c 'qa!'
cat /tmp/nvim-debug.log

# Health check (plugin health, LSP, etc.)
./result/bin/nvim --headless -c 'checkhealth' -c 'lua print(vim.api.nvim_exec2("messages", {output=true}).output)' -c 'qa!' 2>&1

# List loaded plugins/scripts
./result/bin/nvim --headless -c 'lua for _, p in ipairs(vim.fn.getscriptinfo()) do print(p.name) end' -c 'qa!' 2>&1

# Show runtimepath (where Neovim looks for files)
./result/bin/nvim --headless -c 'lua print(vim.o.runtimepath:gsub(",", "\n"))' -c 'qa!' 2>&1

# Check if specific plugin/module loaded
./result/bin/nvim --headless -c 'lua print(pcall(require, "telescope") and "telescope: OK" or "telescope: MISSING")' -c 'qa!' 2>&1

# Startup time profiling (identify slow plugins)
./result/bin/nvim --headless --startuptime /tmp/nvim-startup.log -c 'qa!'
cat /tmp/nvim-startup.log

# LSP status (list active LSP servers)
./result/bin/nvim --headless -c 'lua vim.defer_fn(function() for _, c in pairs(vim.lsp.get_clients()) do print(c.name .. ": " .. c.config.cmd[1]) end vim.cmd("qa!") end, 2000)' 2>&1

# Show all keymaps (debug keybinding conflicts)
./result/bin/nvim --headless -c 'lua local maps=vim.api.nvim_get_keymap("n"); for _,m in ipairs(maps) do print(m.lhs .. " -> " .. m.rhs) end' -c 'qa!' 2>&1

# Show autocommands (debug autocmd issues)
./result/bin/nvim --headless -c 'lua print(vim.inspect(vim.api.nvim_get_autocmds({})))' -c 'qa!' 2>&1
```

#### Debugging Workflow

When troubleshooting issues:

1. **Nix-level errors**: `nix flake check` - shows syntax/type errors in config
2. **Lua runtime errors**: `./result/bin/nvim --headless -V1 -c 'qa!' 2>&1` - catches Lua exceptions
3. **Plugin not loading**: `./result/bin/nvim --headless -c 'lua print(pcall(require, "plugin-name") and "OK" or "MISSING")' -c 'qa!'`
4. **Slow startup**: `./result/bin/nvim --headless --startuptime /tmp/nvim-startup.log -c 'qa!' && cat /tmp/nvim-startup.log | sort -n -k 2 | head -20`
5. **Keybinding not working**: Check keymaps with the keymaps command above, look for conflicts or `<Nop>` assignments

---

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

## Nixvim Documentation

Local reference docs are in `references/` — read these before looking anything up online or using a skill.

| File | Contents |
|------|----------|
| `references/core-options.md` | `opts`, `globals`, `keymaps`, `autoCmd`, `highlights`, `userCommands`, `filetype`, `clipboard`, `diagnostic`, `extraConfigLua` |
| `references/plugins.md` | Plugin module system, `settings`, `lazyLoad`, examples for telescope/cmp/treesitter/lualine/etc. |
| `references/lsp.md` | `lsp.servers`, server options, `lspBufAction`, `onAttach`, inlay hints |
| `references/colorschemes.md` | All 34 colorscheme modules with key `settings` options |
| `references/plugin-list.md` | All 434 `plugins.<name>` modules organized by category |
| `references/lsp-server-list.md` | All 203 packaged LSP servers for `lsp.servers.<name>` |
| `references/lib-helpers.md` | `mkRaw`, `__raw`, `listToUnkeyedAttrs`, Nix→Lua conversion rules |
| `references/installation.md` | NixOS, Home Manager, standalone, nix-darwin flake setup |
| `references/performance.md` | `byteCompileLua`, `combinePlugins`, `luaLoader` |

Docs are derived from the official nix-community/nixvim repository. For local development, clone or check out the nixvim source to access the latest documentation. For options not covered locally, use the `find-docs` skill or check **https://nix-community.github.io/nixvim/**.

### When to consult references/

- **Adding a plugin**: Check `references/plugin-list.md` to confirm the module name, then `references/plugins.md` for the `settings` pattern.
- **Configuring LSP**: See `references/lsp.md` for server options and `references/lsp-server-list.md` for available server names.
- **Writing Lua in Nix**: See `references/lib-helpers.md` for `__raw`, `mkRaw`, and the Nix→Lua conversion table.
- **Setting vim options**: See `references/core-options.md` for `opts`, `globals`, `keymaps`, etc.
- **Choosing a colorscheme**: See `references/colorschemes.md`.

## Nix→Lua Translation Common Pitfalls

When converting Lua configs to Nixvim, these patterns frequently cause errors. Avoid them:

| ❌ Wrong (Lua) | ✅ Correct (Nix) | Why |
|-----------------|------------------|-----|
| `func = function() end` | `func.__raw = "function() end"` | Lua functions must be escaped with `__raw` |
| `exclude = {}` | `exclude = []` | Empty lists vs empty attr sets - check the option type |
| `options = { key = value }` | `options = ["--flag"]` or `options.__raw = "{ key = value }"` | Some options expect list of strings, not attr sets |
| `mapping = "<M-r>"` | Define in `keymaps.nix` or use `__raw` for complex values | Keymap options often expect submodules, not strings |
| `sed` (package) | `gnused` | Nix package names differ from command names |
| `no_mappings = false` | `no_mappings = 0` | Some options expect 0/1, not booleans |
| `plugins.nonexistent.enable = true` | Check `references/plugin-list.md` first | Not all plugins are packaged in nixvim |

### Understanding `__raw` for Lua Code

Nixvim's `__raw` attribute allows inserting literal Lua code into the configuration:

```nix
# Direct use (preferred for simple cases)
action.__raw = "vim.lsp.buf.hover"

# Multi-line Lua functions
settings.callback.__raw = ''
  function()
    print("hello from Lua!")
  end
''

# Using mkRaw helper (returns null for empty strings)
callback = lib.nixvim.mkRaw "require('module').function"
```

**Key rules for `__raw`**:
- Wrap entire Lua expressions in strings: `{ __raw = "function() ... end" }`
- Use multi-line strings (`''...'') for functions with multiple lines
- For tables of Lua values, use `__raw` on the whole table or convert each value individually
- When a value expects a function in Lua but Nix type checker expects a string, use `__raw`

### Nix→Lua Conversion Rules (Official)

When writing `settings = { ... }`, nixvim converts Nix values to Lua automatically:

| Nix value | Lua output | Notes |
|-----------|-----------|--------|
| `"hello"` | `"hello"` | Strings quoted as Lua strings |
| `42` | `42` | Integers pass through |
| `3.14` | `3.14` | Floats pass through (via JSON) |
| `true`/`false` | `true`/`false` | Booleans pass through |
| `null` | `nil` | Nix null becomes Lua nil |
| `[ "a" "b" ]` | `{ "a", "b" }` | Lists become Lua arrays |
| `{ foo = 1; }` | `{ foo = 1 }` | Attr sets become Lua tables |
| `{ __raw = "expr"; }` | `expr` | Verbatim Lua code |
| `{ __empty = null; }` | `{}` | Empty table |
| `listToUnkeyedAttrs ["a"] // { x = 1; }` | `{ "a", x = 1 }` | Mixed array+hash table |

### Steps to Add a New Plugin Correctly

1. **Check if packaged**: `rg "plugin-name" references/plugin-list.md`
2. **If not packaged**: Either (a) comment out/omit, or (b) add via `extraPlugins = with pkgs.vimPlugins; [ plugin-name ];`
3. **Check option types**: After adding, run `nix flake check` and read the error carefully - it tells you the expected type
4. **Lua functions**: Always use `__raw = "function() ... end"` syntax
5. **List vs attr set**: If error says "list of string" and you have `{ }`, change to `[ ]`
6. **Keymaps in settings**: Many plugins have separate keymap config that expects submodules; prefer defining keymaps in `keymaps.nix` with standard format

### Official Resources

- **Documentation**: https://nix-community.github.io/nixvim
- **GitHub**: https://github.com/nix-community/nixvim
- **Matrix**: #nixvim:matrix.org
- **Discussions**: https://github.com/nix-community/nixvim/discussions/categories/q-a

The local `references/` folder in this repo is generated from the official nixvim source and is the primary reference. Use the official online docs only when local docs don't cover your use case.

## Working Agreements

- **Check `references/` first before making any change**: The local docs in this repo are derived from the nixvim source and cover all common cases. Fall back to `find-docs` skill or https://nix-community.github.io/nixvim/ only for options not covered there.
- When adding new config modules, import them in `config/default.nix`
- Use the Nix module pattern: accept `config`, `pkgs`, `lib` as function arguments
- Define new keymap prefixes consistently with existing patterns; add a no-op key at the prefix (e.g., `<leader>p` with action `<nop>`)
- When adding plugins, enable them in `plugins.<name>.enable = true`; use `settings` for configuration that doesn't fit Nixvim's direct options
- For Lua code in Nix, always use `__raw = "function() ... end"` to escape the function body as a string
- **Always verify configuration before declaring work complete**:
  1. `nix flake check`
  2. `nix build`
  3. `./result/bin/nvim --headless -V1 -c 'lua print("=== MESSAGES ===\n" .. vim.api.nvim_exec2("messages", {output=true}).output)' -c 'qa!' 2>&1`
- Never commit `result` (the build output directory)
