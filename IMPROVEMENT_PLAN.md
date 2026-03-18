# Nixvim Configuration Improvement Plan

**Created:** 2025-03-18
**Based on:** NEOVIM_CONFIG_RESEARCH.md + context.md analysis

---

## Executive Summary

This plan prioritizes improvements to the Nixvim configuration based on:
- Research from popular Neovim configurations (LazyVim, NvChad, AstroNvim)
- Analysis of awesome-neovim plugin ecosystem
- Current config capabilities and architecture
- Impact vs. effort prioritization

### Quick Wins (5-15 minutes each)
- Enable existing but unused configs
- Import missing modules
- Add high-impact, low-effort plugins

### Core Enhancements (30-60 minutes each)
- Add mini.nvim modules for text editing
- Enhance LSP experience
- Improve UI components

### Advanced Features (1-2 hours each)
- Session management
- Advanced LSP servers
- Testing integration

---

## Phase 1: Quick Wins (Immediate)

### 1.1 Enable Bufferline (Priority: 🔴 Critical)

**Effort:** 5 minutes
**Impact:** High - Essential for multi-buffer workflows

**Current State:**
- `bufferline.nix` exists in `config/` directory
- Not imported in `config/default.nix`

**Action:**
```bash
# Add bufferline.nix to default.nix imports
# File exists at config/bufferline.nix
```

```nix
# In config/default.nix, add:
./bufferline.nix
```

### 1.2 Enable Lualine (Priority: 🔴 Critical)

**Effort:** 5 minutes
**Impact:** High - Better statusline with more information

**Current State:**
- `lualine.enable = true` is commented out in `config/ui.nix`
- Not imported separately

**Action:**
```nix
# Option A: Uncomment in ui.nix
{
  plugins = {
    lualine.enable = true;  # Uncomment this line
    # ... rest of ui.nix
  };
}

# Option B: Create dedicated lualine.nix module
# config/lualine.nix
{
  plugins = {
    lualine = {
      enable = true;
      settings = {
        options = {
          theme = "auto";
          section_separators = { left = "", right = "" };
          component_separators = { left = "", right = "" };
        };
      };
    };
  };
}
```

### 1.3 Add Indent Guides (Priority: 🟡 High)

**Effort:** 10 minutes
**Impact:** Medium-High - Better code readability

**Options:**
- `indent-blankline.nvim` - Full-featured, popular
- `mini.indentscope` - Lightweight, from mini.nvim

**Recommendation:** Start with `indent-blankline.nvim` for familiarity

```nix
# config/indent.nix
{
  plugins = {
    indent-blankline = {
      enable = true;
      settings = {
        char = "┊";
        char_list_blank_space = "┊";
        char_highlight_list_blank_space = "┊";
        space_char_blankline = " ";
        show_current_context = true;
        show_trailing_blankline_indent = false;
        use_treesitter = true;
      };
    };
  };
}
```

### 1.4 Remove Duplicate Bufferline Config (Priority: 🟢 Low)

**Effort:** 5 minutes
**Impact:** Low - Clean up, avoid confusion

**Issue:** Both `bufferline.nix` and `ui.nix` contain bufferline config

**Action:**
- Keep `bufferline.nix` as the source of truth
- Remove `bufferline.enable` from `ui.nix`

---

## Phase 2: Core Text Editing Enhancements

### 2.1 Add mini.ai (Priority: 🔴 Critical)

**Effort:** 20 minutes
**Impact:** Very High - Game-changing better text objects

**Why:** mini.ai provides significantly better text objects than built-in Neovim:
- `ca[` - change around square brackets
- `da"` - delete around quotes
- `ciw` - change inside word (smart, not just word)
- Treesitter-aware - Works with code structure, not just text

```nix
# config/mini.nix
{
  plugins = {
    mini = {
      enable = true;
      modules = {
        ai = {
          enable = true;
          settings = {
            n_lines = 50;
            custom_textobjects = {
              o = ["ao", "ai", "an", "ao", "aa"];
              i = ["ai", "an", "ao"];
              f = ["af", "if", "ao"];
            };
          };
        };
        # Add other mini modules as needed
      };
    };
  };
}
```

**Keybindings to Add:**
```nix
# In keymaps.nix, add mini.ai specific keybindings:
{
  key = "<leader>a";
  mode = ["n" "x"];
  options = { silent = true; desc = "Mini.ai text object"; };
  action.__raw = "function() MiniSurround.config.n_lines = 100 end";
}
```

### 2.2 Add friendly-snippets (Priority: 🔴 Critical)

**Effort:** 15 minutes
**Impact:** Very High - Ready-to-use snippets for all languages

**Why:** Eliminates need to create snippets manually. Includes:
- JavaScript/TypeScript snippets
- Python snippets
- React/Vue/Svelte snippets
- Nix snippets
- And many more

```nix
# config/snippets.nix
{
  plugins = {
    luasnip = {
      enable = true;
      # Add friendly-snippets
    };
  };
}

# Note: Need to add pkgs.vimPlugins.friendly-snippets to inputs
```

### 2.3 Add substitute.nvim (Priority: 🟡 High)

**Effort:** 15 minutes
**Impact:** High - Smart substitution with preview

**Why:** Replace text with preview before committing, better than `:s` command

```nix
# config/substitute.nix
{
  plugins = {
    substitute = {
      enable = true;
      settings = {
        on_substitute = nil;
      };
    };
  };
}
```

### 2.4 Add treesj (Priority: 🟡 High)

**Effort:** 15 minutes
**Impact:** High - Split/join code blocks

**Why:** Essential for working with:
- JavaScript objects (multiline objects, function args)
- Function parameters
- Arrays/lists

```nix
# config/treesj.nix
{
  plugins = {
    treesj = {
      enable = true;
      settings = {
        max_join_length = 150;
        use_treesitter = true;
      };
    };
  };
}
```

---

## Phase 3: LSP Enhancements

### 3.1 Add lspsaga.nvim (Priority: 🟡 High)

**Effort:** 30 minutes
**Impact:** High - Better LSP UI experience

**Features:**
- Pretty code action menu
- Floating documentation windows
- Better hover display
- Enhanced diagnostics
- Rename UI

```nix
# config/lspsaga.nix
{
  plugins = {
    lspsaga = {
      enable = true;
      settings = {
        lightbulb = {
          enable = false;  # We might add nvim-lightbulb separately
        };
        symbol_in_winbar = {
          enable = false;
        };
        ui = {
          border = "rounded";
          title = false;
        };
      };
    };
  };
}
```

### 3.2 Add inc-rename.nvim (Priority: 🟡 High)

**Effort:** 15 minutes
**Impact:** High - Incremental LSP rename with preview

**Why:** Better than vanilla rename, shows changes as you type

```nix
# config/lsp-enhancements.nix
{
  plugins = {
    inc-rename = {
      enable = true;
      settings = {
        input_default = "renaming";
        show_empty = false;
      };
    };
  };
}
```

### 3.3 Add goto-preview.nvim (Priority: 🟢 Medium)

**Effort:** 20 minutes
**Impact:** Medium - Preview definitions in floating window

**Why:** Stay in current buffer while viewing definition

```nix
# config/goto-preview.nix
{
  plugins = {
    goto-preview = {
      enable = true;
      settings = {
        width = 120;
        height = 15;
        border = "rounded";
        default_mappings = {
          close = "<Esc>";
        };
      };
    };
  };
}
```

### 3.4 Expand LSP Servers (Priority: 🟢 Medium)

**Effort:** 30 minutes
**Impact:** Medium - Support for more languages

**Add to lsp.nix:**
```nix
# In config/lsp.nix, add to servers:
servers = {
  # ... existing servers ...
  gopls.enable = true;
  yamlls.enable = true;
  bashls.enable = true;
  dockerls.enable = true;
  cssls.enable = true;
  html.enable = true;
  emmet_ls.enable = true;
  marksman.enable = true;
};
```

### 3.5 Add cmp-path (Priority: 🟢 Low)

**Effort:** 10 minutes
**Impact:** Low-Medium - Better path completions

```nix
# config/cmp.nix - add to sources:
settings = {
  sources = [
    {name = "nvim_lsp";}
    {name = "luasnip";}
    {name = "buffer";}
    {name = "path";}  # Add this
  ];
}
```

---

## Phase 4: Telescope Enhancements

### 4.1 Add telescope-fzf-native (Priority: 🟢 Medium)

**Effort:** 10 minutes
**Impact:** Medium-High - Faster fuzzy finding

**Why:** Native fzf backend is much faster than pure Lua

```nix
# config/navigation.nix - update telescope config
{
  plugins = {
    telescope = {
      enable = true;
      enabledExtensions = [
        "fzf"  # Add this
        "harpoon"
      ];
    };
  };
}
```

### 4.2 Add telescope-undo.nvim (Priority: 🟢 Medium)

**Effort:** 10 minutes
**Impact:** Medium - Visual undo history

**Why:** Better than `:undolist` - shows diff, search, preview

```nix
# config/navigation.nix
{
  plugins = {
    telescope = {
      enabledExtensions = [
        "fzf"
        "harpoon"
        "undo"  # Add this
      ];
    };
  };
}
```

### 4.3 Add Keybindings for New Extensions

```nix
# In keymaps.nix, add:
{
  key = "<leader>fu";
  mode = "n";
  options = { silent = true; desc = "Undo history"; };
  action = ":Telescope undo<CR>";
}
```

---

## Phase 5: Session Management

### 5.1 Add auto-session (Priority: 🟡 High)

**Effort:** 30 minutes
**Impact:** High - Automatic session save/restore

**Features:**
- Auto-save on VimLeave
- Auto-restore on startup
- Named sessions
- Telescope integration

```nix
# config/session.nix
{
  plugins = {
    auto-session = {
      enable = true;
      settings = {
        auto_save = true;
        auto_restore = "last";  # or "cwd", "none"
        log_level = "info";
        suppressed_dirs = {
          "~/";
          "~/Projects";
          "~/Downloads";
          "~/Documents";
          "~/Desktop";
        };
      };
    };
  };
}
```

**Alternative:** Use `mini.sessions` from mini.nvim for lighter approach

### 5.2 Add Session Keybindings

```nix
# In keymaps.nix, add:
{
  key = "<leader>ss";
  mode = "n";
  options = { silent = true; desc = "Save session"; };
  action.__raw = "function() require('auto-session.lib').current_session_name() end";

  key = "<leader>sl";
  mode = "n";
  options = { silent = true; desc = "Load session"; };
  action = ":Telescope sessions<CR>";

  key = "<leader>sd";
  mode = "n";
  options = { silent = true; desc = "Delete session"; };
  action = ":SessionDelete<CR>";
}
```

---

## Phase 6: Git Enhancements

### 6.1 Add git-conflict.nvim (Priority: 🟢 Medium)

**Effort:** 20 minutes
**Impact:** Medium - Better merge conflict handling

**Features:**
- Highlight conflicts
- Navigate between ours/theirs
- Accept ours/theirs easily

```nix
# config/git-enhancements.nix
{
  plugins = {
    git-conflict = {
      enable = true;
      settings = {
        default_mappings = {
          ours = "co";
          theirs = "ct";
          none = "n";
          both = "b";
          next = "]";
          prev = "[";
        };
      };
    };
  };
}
```

---

## Phase 7: Additional Quality of Life Improvements

### 7.1 Add dressing.nvim (Priority: 🟢 Medium)

**Effort:** 10 minutes
**Impact:** Medium - Better UI for inputs/selects

**Why:** Replaces built-in vim.ui with nicer floating windows

```nix
# config/dressing.nix
{
  plugins = {
    dressing = {
      enable = true;
      settings = {
        input = {
          enabled = true;
          relative = "cursor";
          prefer_width = 40;
        };
        select = {
          enabled = true;
          relative = "cursor";
        };
      };
    };
  };
}
```

### 7.2 Add registers.nvim (Priority: 🟢 Low)

**Effort:** 15 minutes
**Impact:** Low-Medium - Better register management

**Why:** Visualize and manage registers more easily

```nix
# config/registers.nix
{
  plugins = {
    registers = {
      enable = true;
      settings = {
        window = {
          border = "rounded";
          max_width = 80;
          max_height = 20;
        };
      };
    };
  };
}
```

### 7.3 Add nvim-lightbulb (Priority: 🟢 Low)

**Effort:** 10 minutes
**Impact:** Low-Medium - Visual code action indicator

```nix
# config/lsp-enhancements.nix - add to file
{
  plugins = {
    nvim-lightbulb = {
      enable = true;
      settings = {
        sign_priority = 10;
        code_lens = false;
      };
    };
  };
}
```

---

## Phase 8: UI & Colorscheme Exploration

### 8.1 Try Alternative Colorschemes (Priority: 🟢 Low)

**Effort:** 30 minutes (exploration only)
**Impact:** Low - Personal preference

**Top Recommendations from Research:**

| Colorscheme | Installs | Why Try |
|-------------|----------|-----------|
| TokyoNight | 788K | Excellent TS/JS highlighting, highly customizable |
| Catppuccin | 662K | Great pastel tones, multiple variants |
| Kanagawa | 579K | Unique artistic feel |

**Action:**
- Try one alternative for 1-2 weeks
- Compare with current Nord theme
- Decide based on personal preference

### 8.2 Test Mini Statusline/Tabline (Priority: 🟢 Low)

**Effort:** 20 minutes
**Impact:** Low - Potential replacement for lualine/bufferline

**Why:** mini.nvim modules are lightweight and well-integrated

```nix
# config/mini-ui.nix
{
  plugins = {
    mini = {
      modules = {
        statusline = {
          enable = true;
          settings = {
            use_icons = true;
            set_winbar_width = 2;
          };
        };
        tabline = {
          enable = true;
          settings = {
            show_icon = true;
            tabpage_section = "right";
          };
        };
      };
    };
  };
}
```

---

## Phase 9: Testing & Debugging

### 9.1 Add dap-ui.nvim (Priority: 🟢 Medium)

**Effort:** 30 minutes
**Impact:** Medium - Better debugging UI

```nix
# config/dap.nix
{
  plugins = {
    dap-ui = {
      enable = true;
      settings = {
        layouts = {
          elements = {
            "repl";
            "console";
            "breakpoints";
            "stacks";
            "watches";
          };
        };
      };
    };
  };
}
```

### 9.2 Add dap-virtual-text (Priority: 🟢 Low)

**Effort:** 10 minutes
**Impact:** Low-Medium - Inline variable values

```nix
# config/dap.nix
{
  plugins = {
    dap-virtual-text = {
      enable = true;
      settings = {
        all_frames = true;
        virt_lines = true;
        virt_text_win_opts = nil;
      };
    };
  };
}
```

### 9.3 Add neotest (Priority: 🟢 Low)

**Effort:** 45 minutes
**Impact:** Medium - Integrated testing

**Note:** May require configuration per language

---

## Implementation Order

### Sprint 1 (Day 1) - 1-2 hours
1. ✅ Enable bufferline.nix
2. ✅ Enable lualine
3. ✅ Add indent-blankline
4. ✅ Remove duplicate bufferline config

### Sprint 2 (Day 2) - 1-2 hours
1. ✅ Add mini.ai
2. ✅ Add friendly-snippets
3. ✅ Add substitute.nvim
4. ✅ Add treesj

### Sprint 3 (Day 3) - 1-2 hours
1. ✅ Add lspsaga.nvim
2. ✅ Add inc-rename.nvim
3. ✅ Add goto-preview.nvim
4. ✅ Expand LSP servers

### Sprint 4 (Day 4) - 1-2 hours
1. ✅ Add telescope-fzf-native
2. ✅ Add telescope-undo.nvim
3. ✅ Add auto-session
4. ✅ Add git-conflict.nvim

### Sprint 5 (Day 5) - 1-2 hours
1. ✅ Add dressing.nvim
2. ✅ Add registers.nvim
3. ✅ Add dap-ui.nvim
4. ✅ Try alternative colorscheme

### Optional/As Needed (Week 2)
1. Testing integration (neotest)
2. Advanced mini.nvim modules exploration
3. UI refinements

---

## Testing Checklist

After each change, verify:

### Basic Testing
- [ ] `nix flake check` - Ensure flake is valid
- [ ] `nix build` - Ensure configuration builds
- [ ] Launch Neovim - Check for errors on startup

### Functional Testing

#### Text Editing (mini.ai)
- [ ] Test text objects: `ca[`, `da"`, `ciw`, `cif`
- [ ] Test nested objects: `da[`, `da{`, `da(`
- [ ] Test Treesitter-aware: try on different file types

#### Session Management
- [ ] Create session: `<leader>ss`
- [ ] Restore session: Close and reopen
- [ ] List sessions: `<leader>sl`
- [ ] Verify auto-save works on exit

#### LSP Enhancements
- [ ] Test lspsaga: Code actions menu (`<leader>ca`)
- [ ] Test inc-rename: Rename with preview
- [ ] Test goto-preview: Peek definition
- [ ] Test new LSP servers: `gopls`, `yamlls`, etc.

#### Telescope
- [ ] Test telescope-fzf: Speed comparison
- [ ] Test telescope-undo: View undo history

#### Git
- [ ] Test git-conflict: Create a merge, test navigation

---

## Rollback Plan

If any change causes issues:

1. **Immediate Rollback:**
   ```bash
   git stash
   # Or restore previous commit
   ```

2. **Test Incrementally:**
   - Make one change at a time
   - Test thoroughly before moving on

3. **Document Issues:**
   - Note any conflicts with existing plugins
   - Update this plan with blockers

---

## Notes

### Configuration Philosophy
- **Incremental:** Make changes in small, testable increments
- **Modular:** Keep each concern in its own module file
- **Reproducible:** Nix ensures configuration works across machines

### Nixvim-Specific Considerations
- Some plugins may not be available in nixvim yet
- Check nixvim docs for supported plugins
- Use `luaConfig.content` for raw Lua when needed
- Use `settings` option for structured config when available

### Keybinding Conflicts
- Watch for conflicts with existing keybindings
- Use `which-key` to discover conflicts
- Document new keybindings in NEOM_CONFIG_RESEARCH.md

---

## Success Metrics

Track improvements:

| Metric | Before | After | Target |
|---------|--------|-------|--------|
| Startup time | ? | < 100ms | Measure with `nvim --startuptime` |
| Plugin count | 19+ | 30-40 | Add 15-20 plugins |
| Buffer management | Basic | With tabs | bufferline enabled |
| Text editing speed | Normal | +20% | mini.ai impact |
| LSP features | Basic | Enhanced | lspsaga + others |

---

## References

- **Research:** `NEOVIM_CONFIG_RESEARCH.md`
- **Context:** `context.md`
- **Nixvim Docs:** https://nix-community.github.io/nixvim/
- **Plugin Reference:** https://github.com/rockerBOO/awesome-neovim
- **Mini.nvim:** https://github.com/nvim-mini/mini.nvim

---

*Last updated: 2025-03-18*
