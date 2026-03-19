# Nixvim Documentation

Source: https://github.com/nix-community/nixvim  
Docs: https://nix-community.github.io/nixvim/

Nixvim is a Neovim configuration framework built on the Nix module system. It lets you configure Neovim — plugins, options, keymaps, LSP, colorschemes — fully declaratively in Nix.

---

## Files in this directory

| File | Contents |
|------|----------|
| `core-options.md` | All top-level config options: opts, globals, keymaps, autoCmd, highlights, userCommands, filetype, clipboard, diagnostic |
| `plugins.md` | Plugin module system, common plugin options, lazy loading, extraPlugins |
| `lsp.md` | `lsp.*` configuration, servers, keymaps, onAttach |
| `colorschemes.md` | Available colorscheme modules (34 total) |
| `plugin-list.md` | All 434 `plugins.*` names, organized by category |
| `lsp-server-list.md` | All 203 packaged LSP servers for `lsp.servers.*` |
| `lib-helpers.md` | `lib.nixvim.*` helper functions (mkRaw, listToUnkeyedAttrs, etc.) |
| `installation.md` | Platform setup: NixOS, Home Manager, standalone, nix-darwin |
| `performance.md` | `performance.byteCompileLua` and `performance.combinePlugins` |

---

## Quick example

```nix
# As a NixOS module (programs.nixvim = { ... })
{
  enable = true;

  opts = {
    number = true;
    relativenumber = true;
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
  };

  globals.mapleader = " ";

  keymaps = [
    { key = "<leader>ff"; action = "<cmd>Telescope find_files<CR>"; options.desc = "Find files"; }
    { key = "<leader>fg"; action = "<cmd>Telescope live_grep<CR>"; options.desc = "Live grep"; }
  ];

  colorschemes.catppuccin.enable = true;

  plugins.telescope.enable = true;
  plugins.treesitter.enable = true;

  plugins.lsp = {
    enable = true;
    servers = {
      nil_ls.enable = true;
      lua_ls.enable = true;
    };
  };
}
```

---

## Platform namespaces

| Platform | Config lives under |
|----------|--------------------|
| NixOS module | `programs.nixvim = { ... }` |
| Home Manager module | `programs.nixvim = { ... }` |
| nix-darwin module | `programs.nixvim = { ... }` |
| Standalone (`makeNixvim`) | direct attribute set passed as module |
