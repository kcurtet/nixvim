# Colorschemes

Colorscheme modules live under `colorschemes.<name>`. They are plugin modules with `isColorscheme = true`, which means enabling them automatically sets `colorscheme = "<name>"`.

---

## Usage

```nix
# Enable a colorscheme module
colorschemes.catppuccin.enable = true;

# With settings
colorschemes.tokyonight = {
  enable = true;
  settings = {
    style = "moon";
    transparent = true;
  };
};

# Plain string (for colorschemes not available as modules)
colorscheme = "gruvbox";
```

---

## Available colorschemes (34 total)

### catppuccin
```nix
colorschemes.catppuccin = {
  enable = true;
  settings = {
    flavour = "macchiato";  # latte, frappe, macchiato, mocha
    transparent_background = false;
    term_colors = false;
    integrations = {
      telescope.enabled = true;
      nvimtree = true;
      treesitter = true;
      gitsigns = true;
      which_key = true;
      cmp = true;
      notify = true;
    };
    color_overrides.mocha = {
      base = "#1e1e2e";
    };
    custom_highlights.__raw = ''
      function(colors)
        return {
          Comment = { fg = colors.flamingo },
        }
      end
    '';
  };
};
```

### tokyonight
```nix
colorschemes.tokyonight = {
  enable = true;
  settings = {
    style = "moon";       # storm, moon, night, day
    light_style = "day";
    transparent = false;
    terminal_colors = true;
    styles = {
      comments.italic = true;
      keywords.italic = true;
      sidebars = "dark";
      floats = "dark";
    };
    on_highlights.__raw = ''
      function(hl, c)
        hl.LineNr = { fg = c.dark5 }
      end
    '';
  };
};
```

### gruvbox
```nix
colorschemes.gruvbox = {
  enable = true;
  settings = {
    terminal_colors = true;
    contrast_dark = "medium";   # soft, medium, hard
    contrast_light = "medium";
    bold = true;
    italic = {
      strings = false;
      emphasis = false;
      comments = false;
    };
    palette_overrides = {
      bright_blue = "#5476b2";
    };
  };
};
```

### rose-pine
```nix
colorschemes.rose-pine = {
  enable = true;
  settings = {
    variant = "main";     # auto, main, moon, dawn
    dark_variant = "main";
    bold_vert_split = false;
    dim_nc_background = false;
    disable_background = false;
    disable_float_background = false;
    disable_italics = false;
    highlight_groups = {
      Comment.italic = true;
    };
  };
};
```

### kanagawa
```nix
colorschemes.kanagawa = {
  enable = true;
  settings = {
    # theme: wave, dragon, lotus
    # background: { dark = "wave|dragon"; light = "lotus"; }
    background = { dark = "wave"; light = "lotus"; };
    transparent = false;
    terminalColors = true;
    dimInactive = false;
    overrideColors = { };
    theme = "wave";
  };
};
```

### nord
```nix
colorschemes.nord = {
  enable = true;
  settings = {
    contrast = false;          # dark sidebars/popups
    borders = false;           # split borders
    disable_background = false;
    cursorline_transparent = false;
    enable_sidebar_background = false;
    italic = true;
  };
};
```

### onedark
```nix
colorschemes.onedark = {
  enable = true;
  settings = {
    style = "dark";      # dark, darker, cool, deep, warm, warmer, light
    transparent = false;
    term_colors = true;
    ending_tildes = false;
  };
};
```

### everforest
```nix
colorschemes.everforest = {
  enable = true;
  settings = {
    background = "medium";     # soft, medium, hard
    transparent_background_level = 0;  # 0, 1, 2
    italics = 1;
    cursor = "auto";
  };
};
```

### dracula / dracula-nvim
```nix
colorschemes.dracula.enable = true;
# OR the nvim-specific version:
colorschemes.dracula-nvim = {
  enable = true;
  settings = {
    transparent_bg = false;
    italic_comment = true;
  };
};
```

### nightfox (multiple variants)
```nix
colorschemes.nightfox = {
  enable = true;
  settings = {
    options = {
      transparent = false;
      styles = {
        comments = "italic";
        keywords = "bold";
      };
    };
  };
};
# flavours: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
```

### ayu
```nix
colorschemes.ayu = {
  enable = true;
  settings = {
    # mirage, dark, light
  };
};
```

### bamboo
```nix
colorschemes.bamboo = {
  enable = true;
  settings = {
    style = "vulgaris";    # vulgaris, multiplex, light
  };
};
```

### base16
```nix
colorschemes.base16 = {
  enable = true;
  colorscheme = "gruvbox-dark-hard";
  # OR custom:
  settings = {
    base00 = "#1d2021";
    base01 = "#3c3836";
    # ... base02 through base0F
  };
};
```

### cyberdream
```nix
colorschemes.cyberdream = {
  enable = true;
  settings = {
    italic_comments = false;
    transparent = false;
    borderless_telescope = true;
  };
};
```

### github-theme
```nix
colorschemes.github-theme = {
  enable = true;
  settings = {
    options = { transparent = false; };
    # palettes, specs, groups for overrides
  };
};
```

### gruvbox-material / gruvbox-material-nvim
```nix
colorschemes.gruvbox-material.enable = true;
colorschemes.gruvbox-material-nvim.enable = true;
```

### gruvbox-baby
```nix
colorschemes.gruvbox-baby.enable = true;
```

### kanagawa-paper
```nix
colorschemes.kanagawa-paper.enable = true;
```

### melange
```nix
colorschemes.melange.enable = true;
```

### mini-base16 / mini-hues
```nix
colorschemes.mini-base16 = {
  enable = true;
  settings = {
    palette = {
      base00 = "#1d2021";
      # ...
    };
  };
};
colorschemes.mini-hues.enable = true;
```

### modus
```nix
colorschemes.modus = {
  enable = true;
  settings = {
    style = "modus_operandi";  # modus_operandi (light) or modus_vivendi (dark)
  };
};
```

### monokai-pro
```nix
colorschemes.monokai-pro = {
  enable = true;
  settings = {
    filter = "pro";  # pro, classic, machine, octagon, ristretto, spectrum
  };
};
```

### moonfly
```nix
colorschemes.moonfly.enable = true;
```

### one
```nix
colorschemes.one.enable = true;
```

### oxocarbon
```nix
colorschemes.oxocarbon.enable = true;
```

### palette
```nix
colorschemes.palette.enable = true;
```

### poimandres
```nix
colorschemes.poimandres.enable = true;
```

### solarized-osaka
```nix
colorschemes.solarized-osaka.enable = true;
```

### vague
```nix
colorschemes.vague.enable = true;
```

### vscode
```nix
colorschemes.vscode = {
  enable = true;
  settings = {
    color_overrides = { };
    group_overrides = { };
  };
};
```
