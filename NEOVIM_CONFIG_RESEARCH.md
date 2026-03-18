# Neovim Configuration Research

**Research Date:** 2025-03-18
**Goal:** Improve Nixvim configuration by studying popular Neovim configurations

---

## Top 5 Neovim Distributions

| Distribution | GitHub Stars | Description | Key Features |
|-------------|---------------|--------------|--------------|
| **LazyVim** | 25.4k | Minimal, batteries-included | Plugin lazy loading, sensible defaults, easy customization |
| **NvChad** | 28k | Fast, beautiful UI | Custom base, 20-70ms startup, theme system |
| **LunarVim** | 19.3k | IDE-like features | Community-driven, extensive plugin collection |
| **AstroNvim** | 14.2k | User-friendly | Template system, community plugins, easy setup |
| **Kickstart.nvim** | - | Educational starter | Minimal, well-documented, learning-focused |

---

## Plugin Categories & Popular Options

### 🔍 Search & Fuzzy Finding

| Plugin | Purpose | Popularity | Notes |
|--------|---------|------------|-------|
| telescope.nvim | Fuzzy finder (files, grep, etc.) | ⭐⭐⭐⭐⭐ | Essential, highly extensible |
| telescope-fzf-native | Faster fzf backend | ⭐⭐⭐⭐ | Native performance boost |
| telescope-live-grep-args | Live grep with arguments | ⭐⭐⭐ | Grep with flags |
| telescope-undo.nvim | Undo history | ⭐⭐⭐ | Visual undo tree |
| telescope-file-browser.nvim | File browser | ⭐⭐⭐ | Better than built-in |
| mini.pick | Lightweight fuzzy finder | ⭐⭐⭐ | Alternative to Telescope |

**Current Config:** ✅ telescope.nvim + harpoon extension

**Recommendations:**
- Add `telescope-fzf-native` for performance
- Add `telescope-undo.nvim` for undo history
- Add `telescope-file-browser.nvim` for file operations

---

### 🌳 File Explorer

| Plugin | Purpose | Popularity | Notes |
|--------|---------|------------|-------|
| neo-tree.nvim | File explorer sidebar | ⭐⭐⭐⭐ | Full-featured, git integration |
| oil.nvim | Edit filesystem like buffer | ⭐⭐⭐⭐ | Novel approach, inline editing |
| nvim-tree.lua | Classic tree | ⭐⭐⭐ | Older, still popular |
| mini.files | Simple file browser | ⭐⭐⭐ | Lightweight, minimal |

**Current Config:** ✅ neo-tree.nvim

**Recommendations:**
- Consider adding `oil.nvim` as complementary tool (neo-tree for browsing, oil for editing)

---

### 🎨 UI & Colorschemes

#### Popular Colorschemes
| Colorscheme | Popularity | Style | Notes |
|-------------|------------|--------|-------|
| TokyoNight | ⭐⭐⭐⭐⭐ | Dark, clean | Very popular, multiple variants |
| Catppuccin | ⭐⭐⭐⭐⭐ | Pastel, aesthetic | Multiple flavors, extensive support |
| Nord | ⭐⭐⭐⭐ | Arctic, cool blue | **Current config** |
| Gruvbox | ⭐⭐⭐⭐ | Retro, warm | Classic, very popular |
| Dracula | ⭐⭐⭐⭐ | Dark, purple | Classic dark theme |
| Rose Pine | ⭐⭐⭐⭐ | Natural, pastel | Rose color palette |

#### UI Enhancement Plugins

| Plugin | Purpose | Popularity | Notes |
|--------|---------|------------|-------|
| lualine.nvim | Better statusline | ⭐⭐⭐⭐⭐ | Essential, highly customizable |
| bufferline.nvim | Buffer tabs | ⭐⭐⭐⭐ | Essential for multi-buffer workflows |
| which-key.nvim | Keybinding popup | ⭐⭐⭐⭐⭐ | **Already have** |
| dressing.nvim | Better UI inputs | ⭐⭐⭐⭐ | Replaces vim.ui |
| indent-blankline.nvim | Indentation guides | ⭐⭐⭐⭐ | Visual indent markers |
| mini.indentscope | Minimal indent | ⭐⭐⭐ | Lightweight alternative |
| nvim-notify | Better notifications | ⭐⭐⭐⭐ | Floating notifications |
| noice.nvim | Better cmdline/ui | ⭐⭐⭐⭐ | **Already have** |
| fidget.nvim | LSP progress | ⭐⭐⭐⭐ | **Already have** |
| web-devicons.nvim | File icons | ⭐⭐⭐⭐⭐ | **Already have** |

**Current Config:** ✅ which-key, noice, fidget, web-devicons
**Commented Out:** bufferline, lualine

**Recommendations:**
- **HIGH PRIORITY:** Enable `bufferline.nvim` (config exists, just uncomment)
- **HIGH PRIORITY:** Enable `lualine.nvim` (config exists, just uncomment)
- Add `dressing.nvim` for nicer inputs
- Add `indent-blankline.nvim` for indent guides

---

### ⚡ LSP & Autocomplete

#### Core LSP

| Plugin | Purpose | Popularity | Status |
|--------|---------|------------|--------|
| nvim-lspconfig | LSP server configs | ⭐⭐⭐⭐⭐ | ✅ Have (via nixvim) |
| mason.nvim | LSP installer | ⭐⭐⭐⭐⭐ | Nixvim handles this |
| mason-lspconfig.nvim | Mason + lspconfig bridge | ⭐⭐⭐⭐ | Nixvim handles this |

#### LSP Enhancements

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| lspsaga.nvim | Enhanced LSP UI | ⭐⭐⭐⭐ | ❌ No |
| nvim-lightbulb | Code action lightbulb | ⭐⭐⭐⭐ | ❌ No |
| inc-rename.nvim | Incremental rename | ⭐⭐⭐⭐ | ❌ No |
| goto-preview.nvim | Preview definitions | ⭐⭐⭐⭐ | ❌ No |
| glance.nvim | Pretty LSP viewer | ⭐⭐⭐ | ❌ No |
| lsp-lines.nvim | Virtual line diagnostics | ⭐⭐⭐ | ❌ No |
| trouble.nvim | Diagnostics list | ⭐⭐⭐⭐ | ✅ Yes |
| fidget.nvim | LSP progress | ⭐⭐⭐⭐ | ✅ Yes |
| noice.nvim | Better cmdline | ⭐⭐⭐⭐ | ✅ Yes |
| lsp-signature.nvim | Signature hints | ⭐⭐⭐ | ❌ No |
| lspkind.nvim | Completion icons | ⭐⭐⭐ | ❌ No |
| navbuddy.nvim | Breadcrumbs navigation | ⭐⭐⭐ | ❌ No |
| aerial.nvim | Code outline | ⭐⭐⭐ | ❌ No |
| outline.nvim | Alternative outline | ⭐⭐⭐ | ❌ No |
| symbol-usage.nvim | Usage counts | ⭐⭐⭐ | ❌ No |

#### LSP Servers (Common)

| Server | Languages | Popularity | Have? |
|--------|-----------|------------|-------|
| ts_ls / tsserver | TypeScript/JS | ⭐⭐⭐⭐⭐ | ✅ ts_ls |
| pyright | Python | ⭐⭐⭐⭐⭐ | ✅ Yes |
| lua_ls | Lua | ⭐⭐⭐⭐⭐ | ✅ Yes |
| rust_analyzer | Rust | ⭐⭐⭐⭐⭐ | ✅ Yes |
| nixd | Nix | ⭐⭐⭐⭐ | ✅ Yes |
| gopls | Go | ⭐⭐⭐⭐ | ❌ No |
| clangd | C/C++ | ⭐⭐⭐⭐ | ❌ No |
| jsonls | JSON | ⭐⭐⭐⭐ | ✅ Yes |
| yamlls | YAML | ⭐⭐⭐⭐ | ❌ No |
| cssls | CSS | ⭐⭐⭐ | ❌ No |
| html | HTML | ⭐⭐⭐ | ❌ No |
| emmet_ls | Emmet | ⭐⭐⭐ | ❌ No |
| eslint | JS/TS linting | ⭐⭐⭐⭐ | ❌ No |
| marksman | Markdown | ⭐⭐⭐ | ❌ No |
| bashls | Bash | ⭐⭐⭐ | ❌ No |
| dockerls | Docker | ⭐⭐⭐ | ❌ No |

#### Completion

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| nvim-cmp | Completion engine | ⭐⭐⭐⭐⭐ | ✅ Yes |
| cmp-nvim-lsp | LSP completions | ⭐⭐⭐⭐⭐ | ✅ Yes |
| cmp-buffer | Buffer completions | ⭐⭐⭐⭐ | ✅ Yes |
| cmp-path | Path completions | ⭐⭐⭐⭐ | ❌ No |
| cmp-cmdline | Commandline completions | ⭐⭐⭐⭐ | ❌ No |
| luasnip | Snippet engine | ⭐⭐⭐⭐⭐ | ✅ Yes (via cmp_luasnip) |
| cmp_luasnip | Snippet completions | ⭐⭐⭐⭐⭐ | ✅ Yes |
| friendly-snippets | Snippet collection | ⭐⭐⭐⭐⭐ | ❌ No |
| cmp-git | Git completions | ⭐⭐⭐ | ❌ No |

**Current Config:** ✅ nvim-lspconfig, nvim-cmp, cmp-nvim-lsp, cmp-buffer, luasnip, cmp_luasnip

**Recommendations:**
- Add `lspsaga.nvim` for better LSP UI
- Add `inc-rename.nvim` for incremental rename
- Add `goto-preview.nvim` for previewing definitions
- Add `nvim-lightbulb` for code action indicators
- Add `lsp-signature.nvim` for signature hints
- Add `cmp-path` for path completions
- Add `friendly-snippets` for pre-made snippets
- Add LSP servers: gopls, cssls, html, emmet_ls, yamlls, bashls, dockerls, marksman

---

### 🧪 Diagnostics & Linting

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| trouble.nvim | Pretty diagnostics list | ⭐⭐⭐⭐ | ✅ Yes |
| nvim-lint | Extra linting | ⭐⭐⭐⭐ | ✅ Yes |
| lint.nvim (nixvim) | Linting integration | ⭐⭐⭐⭐ | ✅ Yes |
| conform-nvim | Formatting | ⭐⭐⭐⭐ | ✅ Yes |
| lsp_lines.nvim | Virtual line diagnostics | ⭐⭐⭐ | ❌ No |
| better-diagnostic-virtual-text | Enhanced diagnostics | ⭐⭐⭐ | ❌ No |
| wtf.nvim | AI-powered debugging | ⭐⭐ | ❌ No |

**Current Config:** ✅ trouble, nvim-lint, conform-nvim

---

### 🔧 Editing & Text Manipulation

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| nvim-autopairs | Auto close pairs | ⭐⭐⭐⭐⭐ | ✅ Yes |
| vim-surround | Surround text | ⭐⭐⭐⭐⭐ | ✅ Yes |
| comment.nvim | Commenting | ⭐⭐⭐⭐⭐ | ✅ Yes |
| flash.nvim | Jump labels | ⭐⭐⭐⭐ | ✅ Yes |
| mini.ai | Better text objects | ⭐⭐⭐⭐⭐ | ❌ No |
| mini.surround | Alternative surround | ⭐⭐⭐⭐ | ❌ No |
| mini.pairs | Alternative autopairs | ⭐⭐⭐⭐ | ❌ No |
| mini.indentscope | Indent indicator | ⭐⭐⭐ | ❌ No |
| substitute.nvim | Substitution with preview | ⭐⭐⭐⭐ | ❌ No |
| treesj | Split/join blocks | ⭐⭐⭐⭐ | ❌ No |
| multicursors.nvim | Multiple cursors | ⭐⭐⭐ | ❌ No |
| vim-multiple-cursors | Multiple cursors | ⭐⭐⭐ | ❌ No |
| vim-visual-multi | Multiple cursors | ⭐⭐⭐⭐ | ❌ No |
| nvim-treesj | Split/join | ⭐⭐⭐ | ❌ No |
| nvim-ts-context-commentstring | Context-aware comments | ⭐⭐⭐ | ❌ No |
| auto-tag | Auto-close HTML tags | ⭐⭐⭐ | ❌ No |
| ts-autotag | Treesitter auto-tag | ⭐⭐⭐⭐ | ❌ No |

**Current Config:** ✅ nvim-autopairs, vim-surround, comment.nvim, flash.nvim

**Recommendations (HIGH PRIORITY):**
- **Add `mini.ai`** - Game-changing better text objects (much better than built-in)
- **Add `substitute.nvim`** - Smart substitution with preview
- **Add `treesj`** - Split/join code blocks (JS objects, function args, etc.)
- Add `vim-multiple-cursors` or `vim-visual-multi` for multiple cursors
- Add `ts-autotag` for auto-closing HTML/JSX tags

---

### 📁 Git Integration

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| gitsigns.nvim | Git signs in gutter | ⭐⭐⭐⭐⭐ | ✅ Yes |
| neogit | Magit-like interface | ⭐⭐⭐⭐ | ✅ Yes |
| diffview.nvim | Diff viewer | ⭐⭐⭐⭐ | ✅ Yes |
| lazygit.nvim | Lazygit integration | ⭐⭐⭐⭐ | ✅ Yes (via snacks) |
| git-conflict.nvim | Conflict resolution | ⭐⭐⭐⭐ | ❌ No |
| fugitive.vim | Git commands | ⭐⭐⭐⭐ | ❌ No |
| git-messenger.vim | Git blame popup | ⭐⭐⭐ | ❌ No |

**Current Config:** ✅ gitsigns, neogit, diffview, lazygit

**Recommendations:**
- Add `git-conflict.nvim` for better merge conflict handling
- Consider `fugitive.vim` for Git commands (neogit may cover this)

---

### 🚀 Project & Session Management

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| project-nvim | Project detection | ⭐⭐⭐⭐ | ✅ Yes |
| harpoon.nvim | Quick file navigation | ⭐⭐⭐⭐ | ✅ Yes |
| auto-session | Auto-save/restore sessions | ⭐⭐⭐⭐ | ❌ No |
| persistence.nvim | Simple session management | ⭐⭐⭐⭐ | ❌ No |
| session-manager | Advanced sessions | ⭐⭐⭐ | ❌ No |
| possession.nvim | Session management | ⭐⭐⭐ | ❌ No |
| telescope-project.nvim | Telescope project picker | ⭐⭐⭐ | ❌ No |

**Current Config:** ✅ project-nvim, harpoon

**Recommendations (HIGH PRIORITY):**
- **Add `auto-session`** or `persistence.nvim` for session management

---

### 🧩 Snippet Management

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| luasnip | Snippet engine | ⭐⭐⭐⭐⭐ | ✅ Yes |
| friendly-snippets | Common snippets | ⭐⭐⭐⭐⭐ | ❌ No |
| vim-vsnip | Alternative snippet engine | ⭐⭐⭐ | ❌ No |
| snippets.nvim | Alternative snippets | ⭐⭐⭐ | ❌ No |

**Current Config:** ✅ luasnip

**Recommendations (HIGH PRIORITY):**
- **Add `friendly-snippets`** for pre-made snippets

---

### 🎯 Registers & Yank Management

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| registers.nvim | Better register viewer | ⭐⭐⭐⭐ | ❌ No |
| nvim-neoclip.lua | Clipboard manager | ⭐⭐⭐⭐ | ❌ No |
| yanky.nvim | Yank history | ⭐⭐⭐⭐ | ❌ No |
| clipboard-image.nvim | Image paste | ⭐⭐⭐ | ❌ No |

**Recommendations:**
- Add `registers.nvim` for better register management
- Consider `yanky.nvim` for yank history

---

### 📊 Code Outline & Navigation

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| aerial.nvim | Code outline window | ⭐⭐⭐⭐ | ❌ No |
| outline.nvim | Alternative outline | ⭐⭐⭐⭐ | ❌ No |
| navbuddy.nvim | Breadcrumbs navigation | ⭐⭐⭐⭐ | ❌ No |
| symbol-usage.nvim | Usage counts display | ⭐⭐⭐ | ❌ No |
| lsp-lens.nvim | Reference counts | ⭐⭐⭐ | ❌ No |

**Recommendations:**
- Add `aerial.nvim` or `outline.nvim` for code outline
- Add `navbuddy.nvim` for breadcrumb-style navigation

---

### 🔤 Motion & Navigation

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| flash.nvim | Jump labels | ⭐⭐⭐⭐ | ✅ Yes |
| leap.nvim | Alternative jump | ⭐⭐⭐⭐ | ❌ No |
| hop.nvim | Alternative jump | ⭐⭐⭐ | ❌ No |
| smartsacks | Better cursor movement | ⭐⭐⭐ | ❌ No |
| clever-f | Better f/F | ⭐⭐⭐ | ❌ No |
| mini.bracketed | Bracket pairs navigation | ⭐⭐⭐ | ❌ No |

**Current Config:** ✅ flash.nvim

**Recommendations:**
- Current flash.nvim setup is good
- Consider `mini.bracketed` for bracket navigation

---

### 🪟 Window & Split Management

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| smart-splits | Better splits | ⭐⭐⭐⭐ | ✅ Yes |
| focus.nvim | Auto-focus splits | ⭐⭐⭐ | ❌ No |
| zoomwintab.vim | Zoom window | ⭐⭐⭐ | ❌ No |

**Current Config:** ✅ smart-splits

---

### 📝 Note Taking & Documentation

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| obsidian.nvim | Obsidian vault | ⭐⭐⭐⭐ | ✅ Yes |
| telekasten.nvim | Zettelkasten | ⭐⭐⭐ | ❌ No |
| zk.nvim | Zettelkasten | ⭐⭐⭐ | ❌ No |
| markdown-preview.nvim | Preview MD | ⭐⭐⭐ | ❌ No |

**Current Config:** ✅ obsidian.nvim

---

### 🤖 AI & Copilot

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| copilot.nvim | GitHub Copilot | ⭐⭐⭐⭐ | ✅ Yes |
| codecompanion.nvim | AI chat/assistant | ⭐⭐⭐ | ✅ Yes |
| copilot-cmp | Copilot completions | ⭐⭐⭐ | ❌ No |
| avante.nvim | AI assistant | ⭐⭐⭐ | ❌ No |
| gp.nvim | AI assistant | ⭐⭐⭐ | ❌ No |

**Current Config:** ✅ copilot, codecompanion

**Recommendations:**
- Consider `copilot-cmp` for Copilot in completion menu

---

### 🧪 Testing & Debugging

| Plugin | Purpose | Popularity | Have? |
|--------|---------|------------|-------|
| nvim-dap | Debug adapter | ⭐⭐⭐⭐ | ✅ Yes (dap.nix) |
| dap-ui.nvim | DAP UI | ⭐⭐⭐⭐ | ❌ No |
| dap-virtual-text | Virtual text DAP | ⭐⭐⭐ | ❌ No |
| neotest | Testing framework | ⭐⭐⭐⭐ | ❌ No |
| vim-test | Test runner | ⭐⭐⭐⭐ | ❌ No |
| overseer.nvim | Task runner | ⭐⭐⭐⭐ | ❌ No |

**Current Config:** ✅ nvim-dap (basic)

**Recommendations:**
- Add `dap-ui.nvim` for better debugging UI
- Add `dap-virtual-text` for inline variable values
- Add `neotest` for integrated testing

---

### 🎯 Keybinding Patterns from Popular Configs

#### Common Prefixes

| Prefix | Category | Used? |
|--------|----------|--------|
| `<leader>f` | Find/Telescope | ✅ Yes |
| `<leader>g` | Git | ✅ Yes |
| `<leader>b` | Buffer | ✅ Yes |
| `<leader>w` | Window | ✅ Yes |
| `<leader>l` | LSP | ✅ Yes |
| `<leader>q` | Quit/Quickfix | ✅ Yes |
| `<leader>u` | UI toggles | ✅ Yes |
| `<leader>x` | Trouble/Diagnostics | ✅ Yes |
| `<leader>s` | Search | ✅ Yes (flash) |
| `<leader>T` | Tabs | ✅ Yes |
| `<leader>c` | Code | ✅ Yes |
| `<leader>o` | Organize | ✅ Yes |
| `<leader>a` | Add (Harpoon) | ✅ Yes |
| `<leader>p` | Project | ✅ Yes |
| `<leader>m` | Marks | ✅ Yes |
| `<leader>j` | Jumps | ✅ Yes |
| `<leader>h` | Harpoon | ✅ Yes |
| `<leader>e` | Explorer | ✅ Yes |
| `<leader>d` | Debug | ❌ No |
| `<leader>t` | Toggle | ⚠️ Partial |

**Assessment:** Keybinding coverage is excellent and follows popular conventions!

---

## Current Config Analysis

### ✅ Strengths

1. **Well-organized modular structure** - Each concern in separate module
2. **Comprehensive keybinding system** - Follows popular conventions
3. **Core plugins present** - LSP, completion, telescope, git
4. **Modern choices** - flash.nvim, harpoon, snacks, codecompanion
5. **Nix-specific setup** - Proper nixd integration
6. **Good formatter coverage** - Multiple languages
7. **Linting setup** - Popular tools configured

### ⚠️ Missing High-Value Features

1. **bufferline** - Config exists but not enabled
2. **lualine** - Config exists but not enabled
3. **mini.ai** - Game-changing text objects
4. **friendly-snippets** - Ready-to-use snippets
5. **auto-session** - Session management
6. **lspsaga** - Enhanced LSP UI
7. **substitute.nvim** - Smart substitution
8. **treesj** - Split/join blocks

### 🔧 Configuration Issues

1. `bufferline.nix` and `ui.nix` both have bufferline - duplicate
2. Some high-priority plugins commented out (bufferline, lualine)
3. LSP servers could be expanded for more languages

---

## Priority Recommendations

### 🎯 Top 5 (Immediate)

1. **Enable bufferline.nvim** - Config exists, just uncomment and import
2. **Enable lualine.nvim** - Config exists, just uncomment and import
3. **Add mini.ai** - Better text objects, huge productivity boost
4. **Add auto-session** - Automatic session save/restore
5. **Add friendly-snippets** - Pre-made snippets for all languages

### 🚀 High Value

6. **Add lspsaga.nvim** - Better LSP UI experience
7. **Add substitute.nvim** - Smart substitution with preview
8. **Add treesj** - Split/join code blocks
9. **Add telescope-fzf-native** - Faster fuzzy finding
10. **Add telescope-undo.nvim** - Visual undo history

### 📈 Nice to Have

11. Add `indent-blankline.nvim` for indent guides
12. Add `dressing.nvim` for nicer UI inputs
13. Add `inc-rename.nvim` for incremental rename
14. Add `goto-preview.nvim` for definition preview
15. Add `git-conflict.nvim` for merge conflicts
16. Add more LSP servers (gopls, yamlls, bashls, etc.)
17. Add `copilot-cmp` for Copilot in completion menu
18. Add `dap-ui.nvim` and `dap-virtual-text` for debugging
19. Add `neotest` for integrated testing
20. Add `registers.nvim` for register management

---

## Nixvim Implementation Notes

### Adding Plugins

```nix
# config/module-name.nix
{
  plugins = {
    plugin-name = {
      enable = true;
      settings = {
        # Plugin settings
      };
    };
  };
}
```

### Enabling Existing Configs

These config files exist but are not imported in `default.nix`:
- `bufferline.nix`

These are commented out in `ui.nix`:
- `bufferline.enable = true;`
- `lualine.enable = true;`

### Nixvim Plugin Support

Check if a plugin is supported:
```bash
nix eval .#config.xdg.configFile."nvim".value.plugins | jq 'keys'
```

Or search the nixvim documentation.

---

## Research Sources

- awesome-neovim: https://github.com/rockerBOO/awesome-neovim
- LazyVim: https://github.com/LazyVim/LazyVim
- NvChad: https://github.com/NvChad/NvChad
- AstroNvim: https://github.com/AstroNvim/AstroNvim
- LunarVim: https://github.com/LunarVim/LunarVim
- Various Reddit threads and blog posts

---

## Mini.nvim - Swiss Army Knife Plugin

**GitHub:** nvim-mini/mini.nvim (8.9k stars)
**Overview:** Library of 40+ independent Lua modules improving Neovim experience. Each module can be used separately without startup overhead.

### Text Editing Modules (Recommended Start: `mini.ai`, `mini.operators`, `mini.surround`)

| Module | Purpose | Replaces | Have? |
|---------|---------|-----------|--------|
| **mini.ai** | Extend/create `a`/`i` text objects | Multiple plugins | ❌ No - **HIGH PRIORITY** |
| mini.align | Align text interactively | vim-align | ❌ No |
| mini.comment | Comment lines | comment.nvim alternative | ❌ No |
| mini.completion | Completion & signature help | nvim-cmp alternative | ❌ No |
| mini.keymap | Special key mappings | - | ❌ No |
| mini.move | Move any selection in any direction | - | ❌ No |
| mini.operators | Text edit operators | - | ❌ No |
| mini.pairs | Autopairs alternative | nvim-autopairs | ❌ No |
| mini.snippets | Manage/expand snippets | luasnip alternative | ❌ No |
| mini.splitjoin | Split/join arguments | treesj | ❌ No |
| mini.surround | Surround actions alternative | vim-surround alternative | ❌ No |

### General Workflow Modules (Recommended Start: `mini.bracketed`, `mini.files`, `mini.pick`)

| Module | Purpose | Replaces | Have? |
|---------|---------|-----------|--------|
| mini.bracketed | Go forward/backward with brackets | - | ❌ No |
| mini.basics | Common configuration presets | - | ❌ No |
| mini.bufremove | Remove buffers | - | ❌ No |
| mini.clue | Show next key clues | which-key alternative | ❌ No |
| mini.cmdline | Command line tweaks | - | ❌ No |
| mini.diff | Work with diff hunks | - | ❌ No |
| mini.files | Navigate/manipulate filesystem | neo-tree/oil alternative | ❌ No |
| mini.git | Git integration | gitsigns/neogit alternative | ❌ No |
| mini.jump | Jump to next/previous character | flash/leap alternative | ❌ No |
| mini.jump2d | Jump within visible lines | - | ❌ No |
| mini.pick | Pick anything | telescope alternative | ❌ No |
| mini.sessions | Session management | auto-session alternative | ❌ No |
| mini.visits | Track/reuse file visits | - | ❌ No |

### Appearance Modules (Recommended Start: `mini.hues`, `mini.icons`, `mini.statusline`)

| Module | Purpose | Replaces | Have? |
|---------|---------|-----------|--------|
| mini.animate | Animate common Neovim actions | - | ❌ No |
| mini.base16 | Base16 colorscheme creation | - | ❌ No |
| mini.colors | Tweak/save color schemes | - | ❌ No |
| mini.cursorword | Autohighlight word under cursor | - | ❌ No |
| mini.hipatterns | Highlight patterns in text | - | ❌ No |
| mini.hues | Generate configurable color schemes | - | ❌ No |
| mini.icons | Icon provider | web-devicons alternative | ❌ No |
| mini.indentscope | Visualize/work with indent scope | indent-blankline alternative | ❌ No |
| mini.map | Window with buffer text overview | - | ❌ No |
| mini.notify | Show notifications | nvim-notify alternative | ❌ No |
| mini.starter | Start screen | - | ❌ No |
| mini.statusline | Statusline | lualine alternative | ❌ No |
| mini.tabline | Tabline | bufferline alternative | ❌ No |
| mini.trailspace | Highlight/trailing whitespace | - | ❌ No |

### Key mini.nvim Benefits

1. **Independent modules** - Use only what you need, no overhead
2. **Consistent design** - All modules share same configuration approach
3. **No dependencies** - Each module works standalone
4. **Performance** - Minimal startup time, fast operations
5. **Maintenance** - Single repository, consistent updates

### Recommended mini.nvim Modules for Immediate Value

| Priority | Module | Reason |
|-----------|----------|--------|
| 🔴 1 | mini.ai | Better text objects, huge productivity boost |
| 🔴 2 | mini.sessions | Automatic session management |
| 🔴 3 | mini.indentscope | Visual indent indicators |
| 🟡 4 | mini.bracketed | Better bracket navigation |
| 🟡 5 | mini.surround | Alternative to vim-surround (can replace) |
| 🟢 6 | mini.pairs | Alternative to nvim-autopairs |
| 🟢 7 | mini.align | Text alignment |
| 🟢 8 | mini.move | Move selections |

---

## Nixvim-Specific Best Practices

### Configuration Approach

| Approach | Description | Pros | Cons |
|----------|-------------|-------|-------|
| Pure Lua config | Configure in Lua, use Nix only for packages | Easy to copy configs, familiar syntax | Lose declarative benefits |
| Pure Nixvim | Everything in Nix, reproduce with Nix | Declarative, reproducible | Learning curve for Lua configs |
| Hybrid | Start with Lua config, port to Nixvim | Best of both worlds | Two configs to maintain |

### Nixvim Tips

1. **Most plugins have `settings` option** - Accepts Nix attribute set, translates to Lua
2. **Use `luaConfig.content`** - For raw Lua code that Nixvim doesn't support
3. **Modular structure** - Each concern in separate `.nix` file
4. **Import in `default.nix`** - Centralize all modules

### Nixvim Plugin Configuration

```nix
# Pattern for plugin configuration
{
  plugins.plugin-name = {
    enable = true;
    settings = {
      # Plugin settings here
      option1 = value1;
      option2 = value2;
    };
  };
}
```

### Nixvim Resources

- Official docs: https://nix-community.github.io/nixvim/
- GitHub: https://github.com/nix-community/nixvim
- Neovim options reference: https://nix-community.github.io/nixvim/NeovimOptions/

---

## Productivity Tips & Keybinding Patterns

### Popular Leader Key Choices

| Leader | Popularity | Notes |
|---------|------------|-------|
| Space | ⭐⭐⭐⭐⭐ | Easy to hit with thumb, LazyVim/NvChad default |
| Comma | ⭐⭐⭐ | Right hand friendly, good for Spanish keyboards |
| Backslash | ⭐⭐ | Classic Vim default |
| Semicolon | ⭐⭐ | Easy to reach |

**Current Config:** Space leader ✅ (follows popular convention)

### Common Keybinding Prefixes

| Prefix | Purpose | Used? | Notes |
|---------|----------|--------|-------|
| `<leader>f` | Find/Telescope | ✅ Yes | - |
| `<leader>g` | Git | ✅ Yes | - |
| `<leader>b` | Buffer | ✅ Yes | - |
| `<leader>w` | Window | ✅ Yes | - |
| `<leader>l` | LSP | ✅ Yes | - |
| `<leader>q` | Quit/Quickfix | ✅ Yes | - |
| `<leader>u` | UI toggles | ✅ Yes | - |
| `<leader>x` | Trouble/Diagnostics | ✅ Yes | - |
| `<leader>s` | Search | ✅ Yes | - |
| `<leader>T` | Tabs | ✅ Yes | - |
| `<leader>c` | Code | ✅ Yes | - |
| `<leader>o` | Organize | ✅ Yes | - |
| `<leader>a` | Add | ✅ Yes | - |
| `<leader>p` | Project | ✅ Yes | - |
| `<leader>m` | Marks | ✅ Yes | - |
| `<leader>j` | Jumps | ✅ Yes | - |
| `<leader>h` | Harpoon | ✅ Yes | - |
| `<leader>e` | Explorer | ✅ Yes | - |
| `<leader>z` | Fold | ❌ No | Common addition |

### Productivity Tips

1. **Use `jj` or `jk` to escape insert mode** - Faster than reaching Escape
2. **Space as leader** - Most ergonomic position
3. **Prefix-based keybindings** - Organize by function, easier to remember
4. **Use text objects** - More efficient than character-by-character
5. **Macros for repetitive tasks** - Record once, replay multiple times
6. **Quickfix/location lists** - Central place for errors/search results
7. **Register management** - Named registers for clipboard alternatives
8. **Mark usage** - Quickly jump between locations in file

### Essential Neovim Features to Learn

| Feature | Description | Difficulty |
|----------|-------------|------------|
| Text objects | `ci"` (change inside quotes), `da{` (delete around braces) | 🟡 Medium |
| Macros | `qa` to record, `@a` to replay | 🟡 Medium |
| Registers | `"a` to yank to register a, `"ap` to paste | 🟡 Medium |
| Marks | `ma` to set mark a, `'a` to jump | 🟢 Easy |
| Jumplist | `<C-o>` / `<C-i>` for jump history | 🟢 Easy |
| Quickfix | `:cn` / `:cp` for navigation | 🟢 Easy |
| Folding | `zi` / `zo` / `zc` for fold control | 🟡 Medium |
| Visual mode operations | `v`, `V`, `<C-v>` for different selections | 🟡 Medium |

---

## Performance Optimization Tips

### Lazy Loading Strategies

1. **Load plugins on command** - Only load when command is run
2. **Load on filetype** - Only load for specific filetypes
3. **Load on event** - Load when specific event triggers
4. **Disable unused features** - Turn off plugins you don't use

### Startup Performance

| Tool | Purpose | Usage |
|-------|---------|--------|
| `nvim --startuptime` | Measure startup time | Identify bottlenecks |
| `Lazy profile` | Profile lazy.nvim | Check lazy loading |
| `:Lazy log` | View lazy loading logs | Debug plugin loading |

### General Performance Tips

1. **Limit Treesitter parsers** - Only install for languages you use
2. **Disable unused LSP features** - Inlay hints, semantic tokens
3. **Optimize completion** - Limit completion sources, set timeout
4. **Use native features** - Prefer built-in over plugin alternatives
5. **Profile regularly** - Check for regressions after changes

---

## Top Neovim Colorschemes (by installs - Dotfyle 2026)

| Rank | Colorscheme | Installs | Style | Notes |
|-------|-------------|----------|-------|
| 1 | catppuccin/nvim | 662,5969 | Soft pastels, multiple variants (frappe, latte, macchiato, mocha) |
| 2 | folke/tokyonight.nvim | 788,0889 | Clean dark theme from VSCode, highly customizable |
| 3 | rebelot/kanagawa.nvim | 579,9419 | Inspired by Hokusai painting, dark theme |
| 4 | rose-pine/neovim | 2,969,357 | Rose color palette, natural tones |
| 5 | EdenEast/nightfox.nvim | 392,1278 | Customizable dark theme |
| 6 | navarasu/onedark.nvim | 1,932,218 | Atom One Dark/Light variants |
| 7 | sainnhe/gruvbox-material | 2,508,161 | Gruvbox with Material Palette |
| 8 | projekt0n/github-nvim-theme | 2,420,157 | GitHub's dark theme |
| 9 | sainnhe/everforest | 3,708,127 | Everforest color scheme |
| 10 | Mofiqul/vscode.nvim | 956,110 | VSCode Dark+ inspired |
| 16 | shaunsingh/nord.nvim | 976,088 | **Current config**, Arctic blue theme |

**Colorscheme Recommendations:**

- **Try alternatives** to Nord: TokyoNight (#2), Catppuccin (#1), Kanagawa (#3)
- Nord is still good but less popular than newer options
- Catppuccin has excellent TypeScript/JS syntax highlighting
- TokyoNight is highly customizable, can override any color group

### Colorscheme Comparison

| Colorscheme | Pros | Cons | Best For |
|-------------|--------|-------|-----------|
| **Nord** | Arctic, cool tones, widely supported | Low contrast for some users | **Current setup**, general purpose |
| **TokyoNight** | Highly customizable, great TS/JS support | Can be overwhelming with many options | TypeScript/JavaScript development |
| **Catppuccin** | Pastel colors, many variants, excellent syntax | Some find it too soft | All-round development |
| **Kanagawa** | Unique artistic feel, good contrast | Less common, fewer themes | Creative/visual work |
| **Gruvbox** | Classic, warm, excellent readability | Some find colors too saturated | Retro lovers, long sessions |
| **Rose Pine** | Natural tones, easy on eyes | Dark variants limited | Writing, documentation |
| **One Dark** | Familiar Atom look, popular | Very common, less unique | Coming from VSCode/Atom |

---

## TODO

- [x] Search for popular Neovim configurations
- [x] Research awesome-neovim plugin ecosystem
- [x] Research mini.nvim plugin collection
- [x] Search for Nixvim best practices
- [x] Research productivity tips and keybindings
- [x] Research colorschemes and popularity
- [ ] Explore more specific LSP configurations
- [ ] Research Treesitter-specific enhancements
- [ ] Look into neovim configuration performance optimization
- [ ] Research neovim session management in depth
- [ ] Explore neovim AI integration options

---

*Last updated: 2025-03-18*
