# Plugin System

All 434 plugin modules live under `plugins.<name>`. Colorscheme modules live under `colorschemes.<name>`.

---

## Universal plugin options

Every plugin module created with `mkNeovimPlugin` has these options:

```nix
plugins.telescope = {
  enable = true;         # required — enable the plugin

  settings = { };        # passed to require('telescope').setup(...)
                         # type: attrsOf anything (freeform)

  luaConfig = {
    pre = "";            # Lua inserted before setup()
    content = "";        # Lua inserted as setup() call (rarely override directly)
    post = "";           # Lua inserted after setup()
  };

  lazyLoad = {
    enable = false;      # enable lazy loading (requires plugins.lz-n.enable = true)
    settings = { };      # lz.n spec (cmd, ft, keys, event, after, etc.)
  };

  package = pkgs.vimPlugins.telescope-nvim;  # override package
};
```

### `settings`

`settings` is the direct pass-through to the plugin's `setup()` function. Use the plugin's own documentation for available keys. Values follow Nix→Lua conversion rules (see `lib-helpers.md`).

```nix
plugins.telescope.settings = {
  defaults = {
    file_ignore_patterns = [ "node_modules" ".git" ];
    layout_config.horizontal.width = 0.9;
  };
  pickers = {
    find_files = { hidden = true; };
  };
};
```

---

## Lazy loading

Lazy loading requires `plugins.lz-n.enable = true` (or `plugins.lazy.enable = true`, but only one at a time).

```nix
plugins.lz-n.enable = true;

plugins.telescope = {
  enable = true;
  lazyLoad = {
    enable = true;
    settings = {
      cmd = "Telescope";           # load on :Telescope
      # OR:
      ft = [ "markdown" ];         # load on filetype
      # OR:
      keys = [
        { __unkeyed-1 = "<leader>ff"; desc = "Find files"; }
      ];
      # OR:
      event = "BufReadPost";       # load on event
      after.__raw = ''
        function()
          -- called after plugin loads
        end
      '';
    };
  };
};
```

**Important:** You must have a lazy loading provider enabled, or nixvim will show a warning.

Only one lazy loader can be enabled at a time (`lz-n` or `lazy`).

---

## Plugins with extra options

Some plugins add options outside `settings`. Examples:

### telescope

```nix
plugins.telescope = {
  enable = true;

  # Telescope-specific extra options
  keymaps = {
    "<leader>ff" = "find_files";
    "<leader>fg" = "live_grep";
    "<C-p>" = {
      action = "git_files";
      options.desc = "Git files";
    };
  };

  highlightTheme = null;       # defaults to config.colorscheme
  enabledExtensions = [ ];     # manually add extensions not natively supported
};
```

### lualine

```nix
plugins.lualine = {
  enable = true;
  settings = {
    options = {
      theme = "catppuccin";
      globalstatus = true;
      section_separators = { left = ""; right = ""; };
      component_separators = { left = ""; right = ""; };
    };
    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [ "branch" "diff" "diagnostics" ];
      lualine_c = [ "filename" ];
      lualine_x = [ "encoding" "fileformat" "filetype" ];
      lualine_y = [ "progress" ];
      lualine_z = [ "location" ];
    };
  };
};
```

### treesitter

```nix
plugins.treesitter = {
  enable = true;
  settings = {
    highlight.enable = true;
    indent.enable = true;
    incremental_selection.enable = true;
    ensure_installed = [ "nix" "lua" "typescript" "rust" "python" ];
    # or "all"
  };
};
```

### cmp (nvim-cmp)

```nix
plugins.cmp = {
  enable = true;
  settings = {
    mapping = {
      "<C-n>".__raw = ''require("cmp").mapping.select_next_item()'';
      "<C-p>".__raw = ''require("cmp").mapping.select_prev_item()'';
      "<C-y>".__raw = ''require("cmp").mapping.confirm({ select = true })'';
      "<C-Space>".__raw = ''require("cmp").mapping.complete()'';
    };
    sources = [
      { name = "nvim_lsp"; }
      { name = "luasnip"; }
      { name = "buffer"; }
      { name = "path"; }
    ];
    snippet.expand.__raw = ''
      function(args)
        require("luasnip").lsp_expand(args.body)
      end
    '';
  };
};
```

### which-key

```nix
plugins.which-key = {
  enable = true;
  settings = {
    delay = 500;
    spec = [
      { __unkeyed-1 = "<leader>f"; group = "find"; }
      { __unkeyed-1 = "<leader>g"; group = "git"; }
      { __unkeyed-1 = "<leader>l"; group = "lsp"; }
    ];
  };
};
```

### bufferline

```nix
plugins.bufferline = {
  enable = true;
  settings = {
    options = {
      diagnostics = "nvim_lsp";
      separator_style = "slant";
      offsets = [
        {
          filetype = "neo-tree";
          text = "File Explorer";
          highlight = "Directory";
          separator = true;
        }
      ];
    };
  };
};
```

### neo-tree

```nix
plugins.neo-tree = {
  enable = true;
  settings = {
    close_if_last_window = true;
    window.width = 30;
  };
};
```

---

## Plugin manager plugins

```nix
# lazy.nvim (as a lazy-loader AND plugin manager)
plugins.lazy = {
  enable = true;
  # Note: enabling this as the lazy provider conflicts with lz-n
};

# lz-n (lazy loading only, recommended)
plugins.lz-n.enable = true;
```

---

## CMP source plugins

These add sources to nvim-cmp. Enable them alongside `plugins.cmp`:

- `plugins.cmp-git.enable = true`
- `plugins.cmp-ai.enable = true`
- `plugins.cmp-tabby.enable = true`
- `plugins.cmp-tabnine.enable = true`
- `plugins.copilot-cmp.enable = true`
- `plugins.friendly-snippets.enable = true`

## blink-cmp (alternative completion engine)

```nix
plugins.blink-cmp = {
  enable = true;
  settings = {
    keymap.preset = "default";
    sources.default = [ "lsp" "path" "snippets" "buffer" ];
  };
};
```

---

## Snippets

```nix
plugins.luasnip = {
  enable = true;
  settings = {
    history = true;
    updateevents = "TextChanged,TextChangedI";
  };
};

plugins.friendly-snippets.enable = true;  # pre-made snippet collection
```

---

## Git plugins

```nix
plugins.gitsigns = {
  enable = true;
  settings = {
    current_line_blame = false;
    signs = {
      add.text = "│";
      change.text = "│";
      delete.text = "_";
    };
  };
};

plugins.fugitive.enable = true;
plugins.lazygit.enable = true;
plugins.neogit = {
  enable = true;
  settings.integrations.diffview = true;
};
plugins.diffview.enable = true;
```

---

## DAP (Debug Adapter Protocol)

```nix
plugins.dap = {
  enable = true;
  # language-specific adapters:
};
plugins.dap-ui.enable = true;
plugins.dap-virtual-text.enable = true;
plugins.dap-go.enable = true;
plugins.dap-python.enable = true;
plugins.dap-lldb.enable = true;
```

---

## AI plugins

```nix
plugins.copilot-lua.enable = true;
plugins.copilot-vim.enable = true;
plugins.copilot-chat = {
  enable = true;
  settings = { window.layout = "float"; };
};
plugins.codecompanion.enable = true;
plugins.avante.enable = true;
plugins.claude-code.enable = true;
```
