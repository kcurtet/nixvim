# Nixvim Configuration

**A modular, performant Neovim configuration built with nixvim and flake-parts**

This configuration provides a comprehensive modern Neovim experience with:
- 🚀 **Fast startup** - Only plugins you use are loaded
- 🎨 **Beautiful UI** - Bufferline + Lualine status line
- ⚡ **Powerful text editing** - mini.ai, substitute, treesj for advanced operations
- 🔍 **Smart navigation** - Telescope with fzf-native, Harpoon for quick file access
- 🧩 **Full LSP** - Enhanced LSP UI with lspsaga, many language servers
- 💾 **Session management** - Auto-save/restore sessions
- 🎯 **Productivity features** - Smart substitution, indentation guides, better UI

---

## 🚀 Quick Start

### Prerequisites

- **NixOS** or any Linux distribution with Nix
- **Neovim 0.9+** (nixvim requires Neovim 0.9 or higher)

### Install & Run

```bash
# Clone or navigate to this repository
cd /path/to/nixvim

# Run the configuration
nix run

# For development/testing (rebuilds config)
nix run .#nixvim
```

---

## 📚 Configuration Structure

```
nixvim/
├── config/           # Modular configuration files
│   ├── default.nix      # Main import file
│   ├── options.nix      # Nix options for paths
│   ├── system.nix       # System-level settings
│   ├── ui.nix          # Colorscheme, statusline, bufferline
│   ├── bufferline.nix  # Buffer tabs
│   ├── lualine.nix      # (Future) Could enable separate lualine module
│   ├── mini.nix         # mini.nvim modules (ai, surround, pairs, etc.)
│   ├── snippets.nix      # Snippet configuration
│   ├── substitute.nix    # Smart substitution
│   ├── treesj.nix       # Split/join code blocks
│   ├── lspsaga.nix      # Enhanced LSP UI
│   ├── lsp-enhancements.nix  # inc-rename, goto-preview
│   ├── lsp.nix           # LSP servers and core config
│   ├── session.nix       # Auto-session management
│   ├── git-enhancements.nix # git-conflict, registers
│   ├── qol.nix          # Better UI (dressing, registers)
│   ├── indent.nix       # Indentation guides
│   ├── keymaps.nix       # All keybindings
│   ├── navigation.nix    # Telescope, Neo-tree, Flash, Harpoon, project-nvim
│   ├── treesit.nix      # Treesitter configuration
│   ├── lint.nix         # Linting configuration
│   ├── format.nix       # Formatting configuration (conform-nvim)
│   ├── cmp.nix           # Completion configuration
│   ├── dap.nix           # Debug adapter protocol
│   ├── term.nix          # Terminal configuration
│   ├── obsidian.nix     # Obsidian note-taking
│   ├── snacks.nix       # Snacks utilities (lazygit, notifier, etc.)
│   ├── codecompanion.nix # AI assistant
│   ├── copilot.nix       # GitHub Copilot
│   └── snacks.nix       # Additional utilities
├── flake.nix          # Nix flake entry point
└── README.md          # This file
```

---

## ✨ Features

### 🎨 UI Components

| Component | Plugin | Description |
|----------|---------|-------------|
| **Colorscheme** | `colorschemes.nord` | Arctic blue theme |
| **Status Line** | `lualine.nvim` | Mode, git branch, LSP status, diagnostics, cursor position |
| **Buffer Tabs** | `bufferline.nvim` | Tab bar showing open buffers, close/switch easily |
| **Input UI** | `dressing.nvim` (qol) | Better vim.ui for inputs and selects |
| **Indent Guides** | `indent-blankline.nvim` | Visual indentation guides with Treesitter support |
| **Notifications** | `fidget.nvim` | LSP progress spinner |
| **Command UI** | `noice.nvim` | Better command-line and notifications |

### ⚡ Text Editing Enhancements

| Feature | Description | Key Example |
|---------|-------------|--------------|
| **mini.ai** | Enhanced text objects (around/inside, treesitter-aware) | `ca[` (change around brackets), `ciw` (change inside word) |
| **mini.surround** | Surround text with tags | `cs"'` (change quotes to single) |
| **mini.pairs** | Auto-close brackets, quotes, etc. | Autocomplete pairs |
| **substitute** | Smart substitution with preview | `:Substitute` |
| **treesj** | Split/join code blocks | `gS` (split), `gJ` (join) |
| **vim-surround** | Classic surround actions | `cs"` (change surrounding quotes) |
| **comment.nvim** | Smart commenting | `gcc` (comment line), `gc` (toggle) |
| **flash.nvim** | Jump to any character | `s` (search and jump) |

### 🔍 Navigation & Search

| Feature | Description | Key Example |
|---------|-------------|--------------|
| **Telescope** | Fuzzy finder | `<leader>ff` (files), `<leader>fg` (grep), `<leader>fb` (buffers) |
| **telescope-fzf** | Native fzf backend (faster) | - |
| **telescope-undo** | Visual undo history | `<leader>fu` |
| **telescope-file-browser** | File operations | `<leader>fb` |
| **Neo-tree** | File explorer sidebar | `<leader>e` |
| **Harpoon** | Quick file bookmarks | `<leader>a` (add), `<leader>1-9` (jump) |
| **Flash** | Jump to character | `s` |
| **mini.bracketed** | Bracket navigation | - |

### ⚡ LSP Features

| Feature | Description | Key Example |
|---------|-------------|--------------|
| **Core LSP** | Language servers | See LSP Servers section below |
| **lspsaga** | Enhanced LSP UI | `<leader>la` (code actions), `<leader>lr` (rename) |
| **inc-rename** | Incremental rename with preview | `<leader>ln` |
| **goto-preview** | Definition preview | - |
| **nvim-lightbulb** | Code action indicator | - |
| **lsp-signature** | Signature hints | `<C-k>` |
| **LSP Inlay Hints** | Inline type hints | `<leader>oh` (toggle) |

### 📁 LSP Servers

| Language | Server | Features |
|----------|---------|----------|
| **TypeScript/JavaScript** | `ts_ls` | Completion, diagnostics, type definitions |
| **Python** | `pyright` | Type checking, inlay hints, strict mode |
| **Rust** | `rust_analyzer` | Full cargo integration |
| **Lua** | `lua_ls` | Completion, diagnostics |
| **JSON** | `jsonls` | Validation, completion |
| **Nix** | `nixd` | Nix language server with options and formatting |
| **Go** | `gopls` | Go language support |
| **YAML** | `yamlls` | YAML validation |
| **Bash** | `bashls` | Shell script support |
| **Docker** | `dockerls` | Dockerfile support |
| **CSS** | `cssls` | Style sheets |
| **HTML** | `html` | HTML support |
| **Emmet** | `emmet_ls` | HTML/CSS abbreviations |
| **Markdown** | `marksman` | Markdown links, wiki links |

### 🔧 Completion

| Source | Description |
|---------|-------------|
| **nvim-lsp** | LSP completion items |
| **luasnip** | Snippet engine |
| **LuaSnip** | Snippet completion |
| **friendly-snippets** | Pre-made snippets collection (JS, TS, Python, React, etc.) |
| **Buffer** | Open buffers |
| **Path** | File paths |

### 📝 Git Integration

| Feature | Description | Key Example |
|---------|-------------|--------------|
| **gitsigns** | Git diff in gutter | `]h` (next hunk), `[h` (prev hunk) |
| **neogit** | Magit-like interface | `<leader>gg` (lazygit) |
| **diffview** | Diff viewer | - |
| **lazygit** | Git CLI in terminal | - |
| **git-conflict** | Merge conflict resolution | `co` (accept ours), `ct` (accept theirs) |

### 💾 Session Management

| Feature | Description | Key Example |
|---------|-------------|--------------|
| **auto-session** | Auto-save on exit, restore on start | `<leader>ss` (save), `<leader>sl` (load), `<leader>sd` (delete), `<leader>si` (list) |
| **Session Directories** | `~/`, `~/Projects`, etc. | - |
| **Suppressed Dirs** | Downloads, Documents, Desktop | - |

### 🧪 Testing & Debugging

| Feature | Description |
|---------|-------------|
| **nvim-dap** | Debug Adapter Protocol |
| **dap-ui** | Debugging UI | - |

---

## 🎹 Keybindings Reference

### Keybinding Prefixes

| Prefix | Category | Notes |
|---------|----------|-------|
| `<leader>f` | Find | Telescope pickers |
| `<leader>g` | Git | Git operations |
| `<leader>b` | Buffer | Buffer management |
| `<leader>w` | Window | Window operations |
| `<leader>l` | LSP | Language Server Protocol |
| `<leader>q` | Quit | Exit operations |
| `<leader>u` | UI | Interface toggles |
| `<leader>x` | Trouble | Diagnostics |
| `<leader>s` | Search | Search operations |
| `<leader>T` | Tabs | Tab management |
| `<leader>c` | Code | Code actions |
| `<leader>o` | Organize | Code organization |
| `<leader>a` | Add | Add operations |
| `<leader>p` | Project | Project operations |
| `<leader>m` | Marks | Mark operations |
| `<leader>j` | Jumps | Jumplist operations |
| `<leader>h` | Harpoon | Harpoon bookmarks |
| `<leader>e` | Explorer | File explorer |
| `<leader>z` | Fold | Fold operations |
| `<leader>d` | Debug | Debug operations |
| `<leader>t` | Toggle | Various toggles |

### Essential Keybindings

| Key | Mode | Action | Description |
|-----|-------|--------|-------------|
| `<space>` | n | Leader key |
| `jj` | i | Escape insert mode |
| `<leader>a` | n | Add to Harpoon |
| `<leader>ff` | n | Find files (Telescope) |
| `<leader>fg` | n | Live grep (Telescope) |
| `<leader>fb` | n | Find buffers (Telescope) |
| `<C-s>` | nis | Save file |
| `<C-l>` | n | Next buffer |
| `<C-h>` | n | Previous buffer |
| `<leader>gg` | n | Open lazygit |
| `;t` | n | Next todo comment |
| `,t` | n | Previous todo comment |
| `s` | n/x/o | Flash jump |
| `<leader>qf` | n | Quick format buffer |
| `<leader>ss` | n | Save session |
| `<leader>sl` | n | Load session |

---

## 🔧 Customization

### Adding New Plugins

1. **Create a new module** in `config/` directory:

```nix
{
  config,
  pkgs,
  lib,
  ...
}:
{
  plugins = {
    plugin-name = {
      enable = true;
      settings = {
        # Plugin-specific settings
      };
    };
  };
}
```

2. **Import it** in `config/default.nix`:

```nix
imports = [
  # ... existing imports
  ./your-new-module
];
```

### Nixvim Patterns

```nix
# Plugin with simple settings
plugins.plugin-name.enable = true;

# Plugin with settings
plugins.plugin-name = {
  enable = true;
  settings = {
    option1 = value1;
    option2 = value2;
  };
};

# Plugin with Lua code
plugins.plugin-name = {
  enable = true;
  luaConfig.content = ''
    require("plugin").setup({
      -- Lua configuration
    })
  '';
};

# Plugin with raw Lua function
keymaps = [
  {
    key = "<leader>x";
    action.__raw = "function() require('plugin').function_name() end";
  }
];
```

---

## 📦 Modular Architecture

### Module Responsibilities

| Module | Responsibility |
|---------|---------------|
| `ui.nix` | Colorscheme, statusline, bufferline, notifications |
| `mini.nix` | Text objects, surround, pairs, brackets, comments, move, splitjoin |
| `lsp.nix` | LSP servers, inlay hints, keymappings, diagnostics |
| `navigation.nix` | Telescope, Neo-tree, Flash, Harpoon, project detection |
| `keymaps.nix` | All keybinding definitions |
| `treesit.nix` | Treesitter configuration (highlights, indent, folds) |
| `cmp.nix` | Completion configuration (sources, mappings) |
| `format.nix` | Formatters per filetype (conform-nvim) |
| `lint.nix` | Linters per filetype (nvim-lint) |

### Adding Dependencies

To use new nixvim plugins that aren't yet available, check:

1. **Check if plugin is supported**: `nix eval .#config.xdg.configFile."nvim".value.plugins | jq 'keys'`
2. **Add to flake inputs** if from external repository

---

## 🧪 Testing Changes

### Build Configuration

```bash
# Validate flake
nix flake check

# Build the configuration
nix run .#nixvim

# Run tests (if available)
nix run .#nixvimConfigurations.default.x86_64-linux.default.test
```

### Verification Checklist

After making changes, verify:

- [ ] Configuration builds without errors
- [ ] Neovim starts without plugin errors
- [ ] Keybindings work as expected
- [ ] LSP servers attach correctly for your languages
- [ ] UI components appear (bufferline, lualine, etc.)
- [ ] Text editing features work (mini.ai, substitute, treesj)
- [ ] Session management saves/restores correctly

### Rollback

If issues occur:
```bash
# Revert last commit
git revert HEAD

# Or revert to specific commit
git revert <commit-hash>
```

---

## 📚 Documentation & Resources

### Internal Documentation

- `NEOVIM_CONFIG_RESEARCH.md` - Research on popular Neovim configurations, plugins, and best practices
- `context.md` - Repository context and architecture for AI agents
- `IMPROVEMENT_PLAN.md` - Detailed improvement plan with phases and priorities

### External References

- **Nixvim Documentation**: https://nix-community.github.io/nixvim/
- **Nixvim Options**: https://nix-community.github.io/nixvim/NeovimOptions/
- **Awesome Neovim**: https://github.com/rockerBOO/awesome-neovim
- **mini.nvim**: https://github.com/nvim-mini/mini.nvim

---

## 🎯 Workflow Tips

### Text Editing with mini.ai

**mini.ai** provides significantly better text objects than built-in Neovim:

| Operation | Key | Description |
|-----------|-----|-------------|
| Change around brackets | `ca[` | Change everything around square brackets |
| Change around quotes | `ca"` | Change everything around quotes |
| Delete around word | `daw` | Delete around word (smart, not just "daw") |
| Delete inside quotes | `da"` | Delete inside quotes |
| Change inside function | `cif` | Change inside function |
| Select around word | `da[` | Select text around brackets |

### Session Management

**auto-session** automatically saves your workspace:
- Saves on `VimLeave` (when you exit Neovim)
- Restores last session on startup
- Use `<leader>ss` to manually save a session
- Use `<leader>sl` with Telescope to load any session

### LSP Productivity

**Enhanced LSP workflow**:
- Use `<leader>ca` for code actions (refactor, extract, etc.)
- Use `<leader>lr` for incremental rename with preview
- Use `<leader>lh` for hover documentation
- Use `<C-k>` for signature help

### Git Workflow

**Fast git operations**:
- `<leader>gg` - Open lazygit in floating terminal
- `]h` / `[h` - Navigate git hunks
- `<leader>gp` - Preview hunk
- Use `git-conflict` keybindings to resolve merge conflicts

---

## 🏗 Architecture Details

### Flake-Based Configuration

This config uses `flake-parts` for modular configuration:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = @inputs: {
    # Expose nixvim as package for `nix run`
    packages = flake-parts.lib.mkFlake {inherit inputs;} { systems = [ ... ]; };

    # Define Nixvim configurations
    nixvimConfigurations = {
      default = inputs.nixvim.lib.evalNixvim {
        inherit system;
        modules = [ self.nixvimModules.default { nixosConfigPath = "..."; nixvimConfigPath = "..."; }];
      };
    };
  };
}
```

### Configuration Inheritance

All modules receive `{config, pkgs, lib}` and can access:
- `config.nixosConfigPath` - Path to NixOS configuration
- `config.nixvimConfigPath` - Path to this Nixvim config
- `pkgs` - Nix packages for plugin dependencies
- `lib` - Nix library functions

---

## 🐛 Troubleshooting

### Common Issues

**Configuration doesn't apply:**
```bash
# Rebuild and rerun
nix run .#nixvim
```

**Plugin errors:**
- Check if plugin is supported in your nixvim version
- Verify plugin configuration syntax
- Check Neovim version compatibility

**Performance issues:**
```bash
# Measure startup time
nvim --startuptime

# Profile nixvim
nix run .#nixvim --profile
```

**Keybinding conflicts:**
- Use `:map <key>` to see what key is mapped
- Check which-key: `<leader>` (shows all leader keybindings)

---

## 📊 Configuration Highlights

### What Makes This Config Special

1. **Modular** - Each concern in separate, focused module
2. **Comprehensive** - 25+ modules covering all aspects of Neovim
3. **Modern** - Latest plugins (mini.nvim, lspsaga, auto-session, telescope-fzf)
4. **Productive** - Advanced text objects, smart substitution, session management
5. **Well-Organized** - Clear keybinding prefixes, intuitive workflows
6. **Reproducible** - Declarative Nix configuration
7. **Cross-Platform** - Supports Linux, macOS (x86_64, aarch64)

### Plugin Count Summary

| Category | Count |
|-----------|-------|
| UI & Visual | 6 plugins |
| Text Editing | 7 plugins |
| Navigation | 6 plugins |
| LSP & Completion | 12 plugins |
| Git Integration | 5 plugins |
| Session & Productivity | 4 plugins |
| Notes & AI | 3 plugins |
| Testing & Debugging | 2 plugins |
| **Total** | 45+ plugins |

---

## 🔄 Recent Changes

### 2025-03-18 - Phase 1: Quick Wins
- ✅ Enabled `bufferline.nvim` - Tab bar for open buffers
- ✅ Enabled `lualine` - Enhanced status line with mode, git branch, LSP status
- ✅ Fixed `flake.nix` - Added `packages` output for `nix run` support
- ✅ Cleaned up `ui.nix` - Removed duplicate commented lines

### 2025-03-18 - Phase 2: Core Text Editing
- ✅ Added `mini.nix` - Enhanced text objects, surround, pairs, brackets, comments, move, splitjoin
- ✅ Added `snippets.nix` - Friendly-snippets collection for all languages
- ✅ Added `substitute.nix` - Smart substitution with preview
- ✅ Added `treesj.nix` - Split/join code blocks (JS objects, function args)

### 2025-03-18 - Phase 3: LSP Enhancements
- ✅ Added `lspsaga.nix` - Enhanced LSP UI with code actions, hover, diagnostics
- ✅ Added `lsp-enhancements.nix` - inc-rename, goto-preview
- ✅ Expanded `lsp.nix` - Added gopls, yamlls, bashls, dockerls, cssls, html, emmet_ls, marksman

### 2025-03-18 - Phase 4: Telescope Enhancements
- ✅ Added `telescope-fzf-native` to `navigation.nix` - Native fzf backend for faster finding
- ✅ Added `telescope-undo.nvim` to `navigation.nix` - Visual undo history
- ✅ Added `telescope-file-browser.nvim` to `navigation.nix` - File operations
- ✅ Added keybindings for new extensions

### 2025-03-18 - Phase 5: Session Management
- ✅ Added `auto-session.nix` - Automatic session save/restore
- ✅ Added session keybindings - Save, load, delete, list sessions
- ✅ Configured suppressed directories - ~/Projects, Downloads, Documents, Desktop

### 2025-03-18 - Phase 6: Git & QoL
- ✅ Added `git-conflict.nvim` - Better merge conflict handling
- ✅ Added `qol.nix` - dressing.nvim, registers.nvim for better UI

### 2025-03-18 - Phase 7: UI & Indentation
- ✅ Added `indent-blankline.nix` - Visual indentation guides with Treesitter

---

## 📝 Contributing

### Making Changes

1. **Fork this repository** if you want to customize
2. **Create a new branch** for your changes: `git checkout -b feature/my-change`
3. **Make your changes** following the modular pattern
4. **Test thoroughly** - Run `nix run .#nixvim` and verify
5. **Commit** with conventional commits: `git commit -m "feat: add new-feature"`

### Commit Message Format

- `feat:` - New feature
- `fix:` - Bug fix
- `refactor:` - Code refactoring
- `perf:` - Performance improvement
- `docs:` - Documentation only
- `chore:` - Maintenance task
- `test:` - Adding tests

---

## 📄 License

This configuration follows the same license as nixvim.

---

## 🤝 Support

For issues, questions, or suggestions:
- Open an issue on GitHub
- Check [Nixvim Documentation](https://nix-community.github.io/nixvim/)
- Check [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim)

---

**Happy configuring! 🚀**
