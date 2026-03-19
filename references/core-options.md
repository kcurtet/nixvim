# Core Configuration Options

All options defined at the top level of a nixvim configuration. These are available on every platform (NixOS, Home Manager, standalone).

---

## Neovim options (`opts`, `globalOpts`, `localOpts`)

Maps directly to `vim.opt.*`, `vim.opt_global.*`, `vim.opt_local.*`.

```nix
opts = {
  number = true;
  relativenumber = true;
  tabstop = 2;
  shiftwidth = 2;
  expandtab = true;
  wrap = false;
  scrolloff = 8;
  signcolumn = "yes";
  colorcolumn = "80";
  undofile = true;
  ignorecase = true;
  smartcase = true;
  mouse = "a";
  splitbelow = true;
  splitright = true;
  termguicolors = true;
  cursorline = true;
  updatetime = 250;
  timeoutlen = 300;
  clipboard = "unnamedplus";  # or use clipboard.register below
};

globalOpts = {
  # vim.opt_global.*
};

localOpts = {
  # vim.opt_local.*
};
```

Type: `attrsOf anything` — any vim option accepted.

Old names `options`, `globalOptions`, `localOptions` are renamed aliases (still work but deprecated).

---

## Global variables (`globals`)

Maps to `vim.g.*`.

```nix
globals = {
  mapleader = " ";
  maplocalleader = ",";
  loaded_netrw = 1;      # disable netrw
  loaded_netrwPlugin = 1;
};
```

---

## Keymaps

### `keymaps`

A list of keybindings set on startup via `vim.keymap.set`.

```nix
keymaps = [
  {
    # Required
    key = "<leader>ff";
    action = "<cmd>Telescope find_files<CR>";

    # Optional
    mode = "n";           # default "n"; can be string or list: ["n" "v"]
    options = {
      silent = true;
      desc = "Find files";
      noremap = true;
      expr = false;
      nowait = false;
      buffer = null;      # buffer number or true for current buffer
    };
  }

  # Raw Lua action
  {
    key = "K";
    action.__raw = "vim.lsp.buf.hover";
  }

  # Multiple modes
  {
    key = "<C-h>";
    action = "<C-w>h";
    mode = [ "n" "v" ];
  }
];
```

**Important:** The `lua` sub-option is deprecated. Use `action.__raw = "..."` instead.

### `keymapsOnEvents`

Register keymaps on a specific autocommand event (e.g., attach to a buffer).

```nix
keymapsOnEvents = {
  "InsertEnter" = [
    {
      key = "<C-y>";
      action.__raw = ''require("cmp").mapping.confirm()'';
    }
  ];
};
```

---

## Autocommands

### `autoGroups`

Define augroups. Keys are group names.

```nix
autoGroups = {
  my_group = { clear = true; };
  nixvim_lsp = { clear = false; };
};
```

### `autoCmd`

Define autocommands. Each entry maps to `vim.api.nvim_create_autocmd`.

```nix
autoCmd = [
  {
    event = "BufWritePre";      # string or list of strings
    pattern = [ "*.nix" "*.lua" ];
    command = "lua vim.lsp.buf.format()";
    # OR:
    callback.__raw = "function() vim.lsp.buf.format() end";
    group = "my_group";         # optional
    desc = "Format on save";    # optional
    once = false;               # optional
    nested = false;             # optional
    buffer = null;              # optional, buffer number
  }
  {
    event = [ "BufEnter" "BufWinEnter" ];
    pattern = "*.md";
    command = "setlocal spell";
  }
];
```

---

## Highlights

### `highlight`

Define new highlight groups (runs before colorscheme loads).

```nix
highlight = {
  MyHighlight = { fg = "#ff0000"; bg = "#000000"; bold = true; };
  ErrorMsg = { fg = "#ed8796"; };
};
```

### `highlightOverride`

Override existing highlight groups (runs after colorscheme loads — use this to tweak colorscheme colors).

```nix
highlightOverride = {
  Comment = { fg = "#7a7a7a"; italic = true; };
  LineNr = { fg = "#5a5a5a"; };
};
```

### `match`

Define match groups via `vim.fn.matchadd`.

```nix
match = {
  ExtraWhitespace = "\\s\\+$";
};
```

---

## User commands (`userCommands`)

Define custom Ex commands via `vim.api.nvim_create_user_command`.

```nix
userCommands = {
  FormatToggle = {
    command.__raw = ''
      function(args)
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      end
    '';
    bang = false;
    desc = "Toggle autoformat for current buffer";
  };

  Grep = {
    command = "grep! <args>";
    nargs = "+";
    complete = "file";
    desc = "Grep wrapper";
  };
};
```

**Command attributes:**
- `command` — string (vimscript) or `{ __raw = "function(args) ... end" }` (Lua)
- `nargs` — `0 | 1 | "*" | "?" | "+"` (`:h command-nargs`)
- `complete` — string or raw Lua
- `range` — `bool | int | "%"`
- `count` — `bool | int`
- `bang` — bool (default `false`)
- `bar` — bool (default `false`)
- `register` — bool (default `false`)
- `force` — bool (default `false`) — overwrite existing command
- `desc` — string

---

## Filetype detection (`filetype`)

Calls `vim.filetype.add()`.

```nix
filetype = {
  extension = {
    nix = "nix";
    mdx = "markdown";
    foo.__raw = ''
      function(path, bufnr)
        return "myfiletype"
      end
    '';
  };
  filename = {
    "Dockerfile" = "dockerfile";
    ".envrc" = "bash";
  };
  pattern = {
    "*.service" = "systemd";
    "/etc/nginx/sites-available/*" = "nginx";
  };
};
```

---

## Clipboard

```nix
# Option 1: set clipboard register directly
clipboard.register = "unnamedplus";  # or ["unnamed" "unnamedplus"]

# Option 2: enable a provider
clipboard.providers.wl-copy.enable = true;   # Wayland
clipboard.providers.xclip.enable = true;     # X11
clipboard.providers.xsel.enable = true;      # X11 alternative
clipboard.providers.pbcopy.enable = true;    # macOS
```

The provider adds the required package to `extraPackages` automatically.

---

## Diagnostics

Passes config to `vim.diagnostic.config()`.

```nix
diagnostic.settings = {
  virtual_text = false;
  virtual_lines = { current_line = true; };
  signs = true;
  underline = true;
  update_in_insert = false;
  severity_sort = true;
  float = {
    border = "rounded";
    source = "always";
  };
};
```

---

## Colorscheme

```nix
colorscheme = "gruvbox";   # string, name of the colorscheme
# OR use a colorscheme module:
colorschemes.catppuccin.enable = true;
```

See `colorschemes.md` for all available colorscheme modules.

---

## Extra config (raw Lua / Vimscript)

```nix
# Lua, inserted in the middle of init.lua
extraConfigLua = ''
  vim.notify("Hello from Nixvim!")
'';

# Inserted before everything else
extraConfigLuaPre = ''
  -- runs first
'';

# Inserted after everything else
extraConfigLuaPost = ''
  -- runs last
'';

# Vimscript, inserted in init.vim
extraConfigVim = ''
  syntax on
  set nocompatible
'';
```

**Order:** `extraConfigLuaPre` → opts/globals → plugin setup → `extraConfigLua` → autoCmd/keymaps → `extraConfigLuaPost`

---

## Extra plugins and packages

```nix
# Plugins not available as nixvim modules
extraPlugins = with pkgs.vimPlugins; [
  vim-toml
  nvim-surround
  {
    plugin = some-plugin;
    config = "let g:some_setting = 1";  # vimscript run after loading
    optional = false;                   # set true to load with :packadd
  }
];

# System packages added to PATH (prefix)
extraPackages = with pkgs; [ ripgrep fd ];

# Added to end of PATH (lower priority than system PATH)
extraPackagesAfter = with pkgs; [ some-tool ];

# Python 3 packages for the python provider
extraPython3Packages = p: [ p.numpy ];

# Environment variables in the neovim wrapper
env = {
  FOO = "bar";
  MY_CONFIG_DIR = "/home/me/.config/nvim";
};
```

---

## Build-level options (top-level only)

These are only available at the top level (not in submodules):

```nix
viAlias = true;          # symlink vi → nvim
vimAlias = true;         # symlink vim → nvim
withRuby = true;         # Ruby provider (default: true)
withNodeJs = false;      # Node.js provider (default: false)
withPerl = false;        # Perl provider (default: false)
withPython3 = true;      # Python 3 provider (default: true)
waylandSupport = true;   # Wayland clipboard support (auto-detected)
wrapRc = true;           # Wrap init.lua into the binary
```

---

## Lua loader

```nix
luaLoader.enable = true;
# Enables the Neovim builtin Lua module loader for faster startup
```
