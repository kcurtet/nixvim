# AGENTS.md

A NixVim configuration repository for managing Neovim configuration using Nix flakes.

## Project Overview

This is a **NixVim** configuration - a way to configure Neovim using the Nix language and module system. The configuration is built as a Nix flake and produces a standalone Neovim package with all plugins and settings baked in.

## Essential Commands

```bash
# Run Neovim with this configuration
nix run

# Validate configuration (run checks)
nix flake check

# Update flake inputs
nix flake update

# Build the configuration package
nix build
```

## Project Structure

```
.
├── flake.nix           # Flake entry point, defines configurations
├── flake.lock          # Pinned input versions
├── README.md           # Project documentation
└── config/             # NixVim module configuration files
    ├── default.nix     # Imports all other config modules
    ├── nixos-path.nix  # Custom options for paths
    ├── options.nix     # Vim options (globals, opts)
    ├── editor.nix      # Editor plugins (comment, pairs, git)
    ├── ui.nix          # UI plugins (colorscheme, statusline)
    ├── keymaps.nix     # All keybindings
    ├── navigation.nix  # File navigation (neo-tree, telescope)
    ├── treesit.nix     # Treesitter configuration
    ├── lsp.nix         # LSP servers and keymaps
    ├── dap.nix         # Debug adapter protocol
    ├── cmp.nix         # Autocompletion
    ├── format.nix      # Formatting (conform-nvim)
    ├── term.nix        # Terminal (toggleterm)
    ├── obsidian.nix    # Obsidian note-taking
    ├── snacks.nix      # Snacks.nvim utilities
    ├── copilot.nix     # GitHub Copilot
    ├── system.nix      # System-specific settings
    └── bufferline.nix  # Buffer line
```

## Configuration Patterns

### Module Structure

Each config file is a NixVim module. Simple modules return an attribute set:

```nix
{
  plugins = {
    plugin-name.enable = true;
  };
}
```

Modules that need access to `config`, `pkgs`, or `lib` use the function form:

```nix
{ config, pkgs, lib, ... }: {
  # configuration here
}
```

### Plugin Configuration

Enable plugins with `plugins.<plugin-name>.enable = true`:

```nix
{
  plugins = {
    telescope.enable = true;
    gitsigns.enable = true;
  };
}
```

Configure plugin settings with `plugins.<plugin-name>.settings`:

```nix
{
  plugins.gitsigns = {
    enable = true;
    settings.diff_opts = {
      internal = true;
    };
  };
}
```

### Lazy Loading

Use `lazyLoad.settings` for lazy-loading plugins:

```nix
{
  plugins.diffview = {
    enable = true;
    lazyLoad.settings = {
      cmd = "DiffviewOpen";
    };
  };
}
```

### Raw Lua Code

Use `__raw` for inline Lua code:

```nix
{
  keymaps = [
    {
      key = "s";
      action.__raw = "function() require('flash').jump() end";
    }
  ];
}
```

Or use multiline strings for complex Lua:

```nix
{
  plugins.conform-nvim.settings.format_on_save = ''
    function(bufnr)
      if vim.g.disable_autoformat then
        return
      end
      return { timeout_ms = 1000, lsp_fallback = true }
    end
  '';
}
```

### Custom Options

Define custom options in modules using `lib.mkOption`:

```nix
{ lib, ... }: {
  options = {
    myCustomPath = lib.mkOption {
      type = lib.types.str;
      default = "/default/path";
      description = "Description of the option";
    };
  };
}
```

Then reference with `config.myCustomPath` in other modules.

### Keymaps

Global keymaps use the `keymaps` list:

```nix
{
  keymaps = [
    {
      key = "<leader>e";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle Neo-tree";
      };
      action = ":Neotree<CR>";
    }
  ];
}
```

LSP-specific keymaps go under `plugins.lsp.keymaps`:

```nix
{
  plugins.lsp.keymaps = {
    silent = true;
    lspBuf = {
      gd = { action = "definition"; desc = "Go to definition"; };
      K = { action = "hover"; desc = "Hover documentation"; };
    };
  };
}
```

### Vim Options

Set vim globals and options:

```nix
{
  globals = {
    mapleader = " ";
    maplocalleader = ",";
  };

  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    expandtab = true;
  };
}
```

### Colorschemes

Enable colorschemes at the top level:

```nix
{
  colorschemes.nord.enable = true;
}
```

### User Commands

Define custom commands:

```nix
{
  userCommands = {
    MyCommand = {
      command.__raw = "function() print('Hello') end";
      desc = "My custom command";
    };
  };
}
```

## Plugin Documentation

Look up plugin options and settings at:
```
https://nix-community.github.io/nixvim/plugins/{name}/index.html
```

For example, `plugins.telescope` → https://nix-community.github.io/nixvim/plugins/telescope/index.html

## Neovim Options Documentation

Core Neovim options (globals, opts, keymaps, etc.) are documented at:
```
https://nix-community.github.io/nixvim/NeovimOptions/index.html
```

## Adding New Plugins

1. Check the plugin documentation URL above for available options
2. Add a new `.nix` file in `config/` (or modify an existing one)
3. Import it in `config/default.nix`
4. Run `nix flake check` to validate
5. Run `nix run` to test

## Key Bindings Reference

| Prefix | Purpose |
|--------|---------|
| `<leader>f` | Find (Telescope) |
| `<leader>g` | Git |
| `<leader>l` | LSP |
| `<leader>b` | Buffer |
| `<leader>w` | Window |
| `<leader>q` | Quit |
| `<leader>x` | Trouble (diagnostics) |
| `<leader>u` | UI toggles |
| `<leader>e` | Neo-tree |

Leader key is `Space`. Local leader is `,`.

## Formatting

The repository uses **alejandra** for Nix formatting. Format-on-save is configured via conform-nvim.

## Multiple Configurations

The flake supports multiple configurations. The default is in `nixvimConfigurations.default`. To add another (e.g., for work), uncomment and modify the example in `flake.nix`.

A helper function `nixvimConfigurations.withPaths` is available for creating configurations with custom paths.

## Gotchas

- **Import new modules**: After creating a new `.nix` file in `config/`, you must add it to the imports list in `config/default.nix`
- **Unused function arguments**: LSP warnings about unused `pkgs`/`lib` are common in modules that don't need them - this is acceptable in Nix module patterns
- **Path interpolation**: When using paths in actions (e.g., for Telescope), use string interpolation: `cwd=${config.nixosConfigPath}`
- **Flake paths are read-only**: The flake evaluates files at build time; changes require re-running `nix run`
