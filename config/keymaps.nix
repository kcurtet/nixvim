{
  config,
  pkgs,
  lib,
  ...
}: {
  keymaps = [
    # Neo-tree
    {
      key = "<leader>e";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle Neo-tree";
      };
      action = ":Neotree<CR>";
    }

    # Telescope - Find
    {
      key = "<leader>f";
      mode = "n";
      options = {
        silent = true;
        desc = "find";
      };
      action = "<nop>";
    }
    {
      key = "<leader>ff";
      mode = "n";
      options = {
        silent = true;
        desc = "Find files";
      };
      action = ":Telescope find_files<CR>";
    }
    {
      key = "<leader>fg";
      mode = "n";
      options = {
        silent = true;
        desc = "Live grep";
      };
      action = ":Telescope live_grep<CR>";
    }
    {
      key = "<leader>fb";
      mode = "n";
      options = {
        silent = true;
        desc = "Find buffers";
      };
      action = ":Telescope buffers<CR>";
    }
    {
      key = "<leader>fh";
      mode = "n";
      options = {
        silent = true;
        desc = "Help tags";
      };
      action = ":Telescope help_tags<CR>";
    }
    {
      key = "<leader>fr";
      mode = "n";
      options = {
        silent = true;
        desc = "Recent files";
      };
      action = ":Telescope oldfiles<CR>";
    }
    {
      key = "<leader>fc";
      mode = "n";
      options = {
        silent = true;
        desc = "Find files in NixOS config";
      };
      action = ":Telescope find_files cwd=${config.nixosConfigPath}<CR>";
    }
    {
      key = "<leader>fx";
      mode = "n";
      options = {
        silent = true;
        desc = "Find files in NixVim config";
      };
      action = ":Telescope find_files cwd=${config.nixvimConfigPath}<CR>";
    }
    {
      key = "<leader>fw";
      mode = "n";
      options = {
        silent = true;
        desc = "Find word under cursor";
      };
      action = ":Telescope grep_string<CR>";
    }

    # Telescope - Git
    {
      key = "<leader>g";
      mode = "n";
      options = {
        silent = true;
        desc = "git";
      };
      action = "<nop>";
    }
    {
      key = "<leader>gc";
      mode = "n";
      options = {
        silent = true;
        desc = "Git commits";
      };
      action = ":Telescope git_commits<CR>";
    }
    {
      key = "<leader>gb";
      mode = "n";
      options = {
        silent = true;
        desc = "Git branches";
      };
      action = ":Telescope git_branches<CR>";
    }
    {
      key = "<leader>gs";
      mode = "n";
      options = {
        silent = true;
        desc = "Git status";
      };
      action = ":Telescope git_status<CR>";
    }

    # Telescope - LSP
    {
      key = "<leader>l";
      mode = "n";
      options = {
        silent = true;
        desc = "lsp";
      };
      action = "<nop>";
    }
    {
      key = "<leader>ls";
      mode = "n";
      options = {
        silent = true;
        desc = "Document symbols";
      };
      action = ":Telescope lsp_document_symbols<CR>";
    }
    {
      key = "<leader>lS";
      mode = "n";
      options = {
        silent = true;
        desc = "Workspace symbols";
      };
      action = ":Telescope lsp_workspace_symbols<CR>";
    }
    {
      key = "<leader>li";
      mode = "n";
      options = {
        silent = true;
        desc = "Implementations";
      };
      action = ":Telescope lsp_implementations<CR>";
    }
    {
      key = "<leader>lr";
      mode = "n";
      options = {
        silent = true;
        desc = "References";
      };
      action = ":Telescope lsp_references<CR>";
    }
    {
      key = "<leader>ld";
      mode = "n";
      options = {
        silent = true;
        desc = "Diagnostics";
      };
      action = ":Telescope diagnostics<CR>";
    }

    # Telescope - Misc
    {
      key = "<leader>fk";
      mode = "n";
      options = {
        silent = true;
        desc = "Keymaps";
      };
      action = ":Telescope keymaps<CR>";
    }
    {
      key = "<leader>fm";
      mode = "n";
      options = {
        silent = true;
        desc = "Marks";
      };
      action = ":Telescope marks<CR>";
    }
    {
      key = "<leader><leader>";
      mode = "n";
      options = {
        silent = true;
        desc = "Find files";
      };
      action = ":Telescope find_files<CR>";
    }
    {
      key = "<leader>/";
      mode = "n";
      options = {
        silent = true;
        desc = "Search in buffer";
      };
      action = ":Telescope current_buffer_fuzzy_find<CR>";
    }

    # Window navigation
    {
      key = "<M-h>";
      mode = "n";
      options = {
        silent = true;
        desc = "Navigate left";
      };
      action = "<C-w>h";
    }
    {
      key = "<M-j>";
      mode = "n";
      options = {
        silent = true;
        desc = "Navigate down";
      };
      action = "<C-w>j";
    }
    {
      key = "<M-k>";
      mode = "n";
      options = {
        silent = true;
        desc = "Navigate up";
      };
      action = "<C-w>k";
    }
    {
      key = "<M-l>";
      mode = "n";
      options = {
        silent = true;
        desc = "Navigate right";
      };
      action = "<C-w>l";
    }

    # Window resize
    {
      key = "<C-Up>";
      mode = "n";
      options = {
        silent = true;
        desc = "Increase window height";
      };
      action = ":resize +2<CR>";
    }
    {
      key = "<C-Down>";
      mode = "n";
      options = {
        silent = true;
        desc = "Decrease window height";
      };
      action = ":resize -2<CR>";
    }
    {
      key = "<C-Left>";
      mode = "n";
      options = {
        silent = true;
        desc = "Decrease window width";
      };
      action = ":vertical resize -2<CR>";
    }
    {
      key = "<C-Right>";
      mode = "n";
      options = {
        silent = true;
        desc = "Increase window width";
      };
      action = ":vertical resize +2<CR>";
    }

    # Buffer navigation
    {
      key = "<leader>b";
      mode = "n";
      options = {
        silent = true;
        desc = "buffer";
      };
      action = "<nop>";
    }
    {
      key = "<C-l>";
      mode = "n";
      options.silent = true;
      options.desc = "Next buffer";
      action = ":bnext<CR>";
    }
    {
      key = "<C-h>";
      mode = "n";
      options.silent = true;
      options.desc = "Previous buffer";
      action = ":bprevious<CR>";
    }
    {
      key = "<leader>bb";
      mode = "n";
      options = {
        silent = true;
        desc = "List buffers";
      };
      action = ":Telescope buffers<CR>";
    }
    {
      key = "<leader>bn";
      mode = "n";
      options = {
        silent = true;
        desc = "Next buffer";
      };
      action = ":bnext<CR>";
    }
    {
      key = "<leader>bp";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous buffer";
      };
      action = ":bprevious<CR>";
    }
    {
      key = "<leader>bd";
      mode = "n";
      options.silent = true;
      options.desc = "Delete buffer";
      action = ":bdelete<CR>";
    }
    {
      key = "<leader>bD";
      mode = "n";
      options.silent = true;
      options.desc = "Force delete buffer";
      action = ":bdelete!<CR>";
    }

    # Move lines up/down
    {
      key = "<A-j>";
      mode = "n";
      options = {
        silent = true;
        desc = "Move line down";
      };
      action = ":m .+1<CR>==";
    }
    {
      key = "<A-k>";
      mode = "n";
      options = {
        silent = true;
        desc = "Move line up";
      };
      action = ":m .-2<CR>==";
    }
    {
      key = "<A-j>";
      mode = "v";
      options = {
        silent = true;
        desc = "Move selection down";
      };
      action = ":m '>+1<CR>gv=gv";
    }
    {
      key = "<A-k>";
      mode = "v";
      options = {
        silent = true;
        desc = "Move selection up";
      };
      action = ":m '<-2<CR>gv=gv";
    }

    # Better indenting
    {
      key = "<";
      mode = "v";
      options = {
        silent = true;
        desc = "Indent left";
      };
      action = "<gv";
    }
    {
      key = ">";
      mode = "v";
      options = {
        silent = true;
        desc = "Indent right";
      };
      action = ">gv";
    }

    # Clear search highlighting
    {
      key = "<Esc>";
      mode = "n";
      options = {
        silent = true;
        desc = "Clear search highlight";
      };
      action = ":nohlsearch<CR>";
    }

    # Save file
    {
      key = "<C-s>";
      mode = ["n" "i" "v"];
      options = {
        silent = true;
        desc = "Save file";
      };
      action = "<Cmd>w<CR>";
    }

    # Quit
    {
      key = "<leader>q";
      mode = "n";
      options = {
        silent = true;
        desc = "quit";
      };
      action = "<nop>";
    }
    {
      key = "<leader>qq";
      mode = "n";
      options.silent = true;
      options.desc = "Quit all";
      action = ":qa<CR>";
    }

    # Trouble
    {
      key = "<leader>x";
      mode = "n";
      options = {
        silent = true;
        desc = "trouble";
      };
      action = "<nop>";
    }
    {
      key = "<leader>xx";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle Trouble";
      };
      action = ":Trouble diagnostics toggle<CR>";
    }
    {
      key = "<leader>xX";
      mode = "n";
      options = {
        silent = true;
        desc = "Buffer diagnostics";
      };
      action = ":Trouble diagnostics toggle filter.buf=0<CR>";
    }
    {
      key = "<leader>xs";
      mode = "n";
      options = {
        silent = true;
        desc = "Symbols (Trouble)";
      };
      action = ":Trouble symbols toggle focus=false<CR>";
    }
    {
      key = "<leader>xq";
      mode = "n";
      options = {
        silent = true;
        desc = "Quickfix (Trouble)";
      };
      action = ":Trouble qflist toggle<CR>";
    }

    # Todo comments
    {
      key = "<leader>xt";
      mode = "n";
      options = {
        silent = true;
        desc = "Todo (Trouble)";
      };
      action = ":Trouble todo toggle<CR>";
    }
    {
      key = ";t";
      mode = "n";
      options = {
        silent = true;
        desc = "Next todo comment";
      };
      action.__raw = "function() require('todo-comments').jump_next() end";
    }
    {
      key = ",t";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous todo comment";
      };
      action.__raw = "function() require('todo-comments').jump_prev() end";
    }

    # Flash.nvim
    {
      key = "s";
      mode = ["n" "x" "o"];
      options = {
        silent = true;
        desc = "Flash";
      };
      action.__raw = "function() require('flash').jump() end";
    }
    {
      key = "S";
      mode = ["n" "x" "o"];
      options = {
        silent = true;
        desc = "Flash Treesitter";
      };
      action.__raw = "function() require('flash').treesitter() end";
    }

    # Git
    {
      key = "<leader>gg";
      mode = "n";
      options = {
        silent = true;
        desc = "Lazygit";
      };
      action.__raw = "function() Snacks.lazygit() end";
    }
    {
      key = ";h";
      mode = "n";
      options = {
        silent = true;
        desc = "Next hunk";
      };
      action.__raw = "function() require('gitsigns').next_hunk() end";
    }
    {
      key = ",h";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous hunk";
      };
      action.__raw = "function() require('gitsigns').prev_hunk() end";
    }
    {
      key = "<leader>gp";
      mode = "n";
      options = {
        silent = true;
        desc = "Preview hunk";
      };
      action.__raw = "function() require('gitsigns').preview_hunk() end";
    }
    {
      key = "<leader>gr";
      mode = "n";
      options = {
        silent = true;
        desc = "Reset hunk";
      };
      action.__raw = "function() require('gitsigns').reset_hunk() end";
    }
    {
      key = "<leader>gB";
      mode = "n";
      options = {
        silent = true;
        desc = "Blame line";
      };
      action.__raw = "function() require('gitsigns').blame_line({ full = true }) end";
    }

    # Toggleterm
    {
      key = "<leader>tt";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle terminal";
      };
      action = ":ToggleTerm<CR>";
    }
    {
      key = "<C-\\>";
      mode = ["n" "t"];
      options = {
        silent = true;
        desc = "Toggle terminal";
      };
      action = "<Cmd>ToggleTerm<CR>";
    }

    # Split windows
    {
      key = "<leader>w";
      mode = "n";
      options = {
        silent = true;
        desc = "window";
      };
      action = "<nop>";
    }
    {
      key = "<leader>wv";
      mode = "n";
      options = {
        silent = true;
        desc = "Split vertical";
      };
      action = ":vsplit<CR>";
    }
    {
      key = "<leader>wh";
      mode = "n";
      options = {
        silent = true;
        desc = "Split horizontal";
      };
      action = ":split<CR>";
    }
    {
      key = "<leader>wq";
      mode = "n";
      options = {
        silent = true;
        desc = "Close window";
      };
      action = ":close<CR>";
    }

    # Format toggles
    {
      key = "<leader>uf";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle buffer autoformat";
      };
      action = ":FormatToggle!<CR>";
    }
    {
      key = "<leader>uF";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle global autoformat";
      };
      action = ":FormatToggle<CR>";
    }

    # ==================== NEW KEYBINDINGS ====================

    # Harpoon - Quick file navigation
    {
      key = "<leader>a";
      mode = "n";
      options = {
        silent = true;
        desc = "Add file to Harpoon";
      };
      action.__raw = "function() require('harpoon'):list():add() end";
    }
    {
      key = "<leader>hh";
      mode = "n";
      options = {
        silent = true;
        desc = "Harpoon quick menu";
      };
      action.__raw = "function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end";
    }
    # Harpoon file slots 1-9
    {
      key = "<leader>h1";
      mode = "n";
      options = {
        silent = true;
        desc = "Harpoon file 1";
      };
      action.__raw = "function() require('harpoon'):list():select(1) end";
    }
    {
      key = "<leader>h2";
      mode = "n";
      options = {
        silent = true;
        desc = "Harpoon file 2";
      };
      action.__raw = "function() require('harpoon'):list():select(2) end";
    }
    {
      key = "<leader>h3";
      mode = "n";
      options = {
        silent = true;
        desc = "Harpoon file 3";
      };
      action.__raw = "function() require('harpoon'):list():select(3) end";
    }
    {
      key = "<leader>h4";
      mode = "n";
      options = {
        silent = true;
        desc = "Harpoon file 4";
      };
      action.__raw = "function() require('harpoon'):list():select(4) end";
    }
    {
      key = "<leader>h5";
      mode = "n";
      options = {
        silent = true;
        desc = "Harpoon file 5";
      };
      action.__raw = "function() require('harpoon'):list():select(5) end";
    }
    {
      key = "<leader>h6";
      mode = "n";
      options = {
        silent = true;
        desc = "Harpoon file 6";
      };
      action.__raw = "function() require('harpoon'):list():select(6) end";
    }
    {
      key = "<leader>h7";
      mode = "n";
      options = {
        silent = true;
        desc = "Harpoon file 7";
      };
      action.__raw = "function() require('harpoon'):list():select(7) end";
    }
    {
      key = "<leader>h8";
      mode = "n";
      options = {
        silent = true;
        desc = "Harpoon file 8";
      };
      action.__raw = "function() require('harpoon'):list():select(8) end";
    }
    {
      key = "<leader>h9";
      mode = "n";
      options = {
        silent = true;
        desc = "Harpoon file 9";
      };
      action.__raw = "function() require('harpoon'):list():select(9) end";
    }
    # Harpoon navigation
    {
      key = "<leader>hn";
      mode = "n";
      options = {
        silent = true;
        desc = "Next Harpoon file";
      };
      action.__raw = "function() local list = require('harpoon'):list() list:next() end";
    }
    {
      key = "<leader>hp";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous Harpoon file";
      };
      action.__raw = "function() local list = require('harpoon'):list() list:prev() end";
    }
    # Harpoon with Telescope
    {
      key = "<leader>hs";
      mode = "n";
      options = {
        silent = true;
        desc = "Search Harpoon files";
      };
      action.__raw = "function() require('telescope').extensions.harpoon.marks() end";
    }
    # Harpoon remove current file
    {
      key = "<leader>hr";
      mode = "n";
      options = {
        silent = true;
        desc = "Remove from Harpoon";
      };
      action.__raw = "function() local list = require('harpoon'):list() list:remove() end";
    }
    # Harpoon clear all
    {
      key = "<leader>hx";
      mode = "n";
      options = {
        silent = true;
        desc = "Clear Harpoon list";
      };
      action.__raw = "function() require('harpoon'):list():clear() end";
    }

    # Code actions (prefix <leader>c)
    {
      key = "<leader>c";
      mode = "n";
      options = {
        silent = true;
        desc = "code";
      };
      action = "<nop>";
    }
    {
      key = "<leader>ca";
      mode = "n";
      options = {
        silent = true;
        desc = "Code actions";
      };
      action.__raw = "function() vim.lsp.buf.code_action() end";
    }
    {
      key = "<leader>cr";
      mode = "n";
      options = {
        silent = true;
        desc = "Rename symbol";
      };
      action.__raw = "function() vim.lsp.buf.rename() end";
    }
    {
      key = "<leader>cf";
      mode = "n";
      options = {
        silent = true;
        desc = "Format buffer";
      };
      action.__raw = "function() vim.lsp.buf.format() end";
    }

    # Project operations (prefix <leader>p)
    {
      key = "<leader>p";
      mode = "n";
      options = {
        silent = true;
        desc = "project";
      };
      action = "<nop>";
    }
    {
      key = "<leader>pr";
      mode = "n";
      options = {
        silent = true;
        desc = "Recent files (project)";
      };
      action = ":Telescope oldfiles cwd=${config.nixvimConfigPath}<CR>";
    }
    {
      key = "<leader>pg";
      mode = "n";
      options = {
        silent = true;
        desc = "Grep in project";
      };
      action = ":Telescope live_grep cwd=${config.nixvimConfigPath}<CR>";
    }
    {
      key = "<leader>pf";
      mode = "n";
      options = {
        silent = true;
        desc = "Find files in project";
      };
      action = ":Telescope find_files cwd=${config.nixvimConfigPath}<CR>";
    }

    # Quickfix navigation (using ; for next, , for previous - ergonomic on Spanish keyboard)
    {
      key = ";q";
      mode = "n";
      options = {
        silent = true;
        desc = "Next quickfix";
      };
      action = ":cnext<CR>";
    }
    {
      key = ",q";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous quickfix";
      };
      action = ":cprev<CR>";
    }
    {
      key = ";Q";
      mode = "n";
      options = {
        silent = true;
        desc = "First quickfix";
      };
      action = ":cfirst<CR>";
    }
    {
      key = ",Q";
      mode = "n";
      options = {
        silent = true;
        desc = "Last quickfix";
      };
      action = ":clast<CR>";
    }
    {
      key = "<leader>qo";
      mode = "n";
      options = {
        silent = true;
        desc = "Open quickfix";
      };
      action = ":copen<CR>";
    }
    {
      key = "<leader>qc";
      mode = "n";
      options = {
        silent = true;
        desc = "Close quickfix";
      };
      action = ":cclose<CR>";
    }

    # Buffer operations (enhanced)
    {
      key = "<leader>bse";
      mode = "n";
      options = {
        silent = true;
        desc = "Save modified buffers";
      };
      action = ":wall<CR>";
    }
    {
      key = "<leader>bcl";
      mode = "n";
      options = {
        silent = true;
        desc = "Close all other buffers";
      };
      action.__raw = "function() local current = vim.api.nvim_get_current_buf(); vim.cmd('bufdo bd'); vim.api.nvim_set_current_buf(current); end";
    }
    {
      key = ";b";
      mode = "n";
      options = {
        silent = true;
        desc = "Next buffer";
      };
      action = ":bnext<CR>";
    }
    {
      key = ",b";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous buffer";
      };
      action = ":bprevious<CR>";
    }

    # Window management (enhanced)
    {
      key = "<leader>we";
      mode = "n";
      options = {
        silent = true;
        desc = "Equalize windows";
      };
      action = ":wincmd =<CR>";
    }
    {
      key = "<leader>wm";
      mode = "n";
      options = {
        silent = true;
        desc = "Maximize window";
      };
      action = ":wincmd _ | wincmd |<CR>";
    }
    {
      key = "<leader>wo";
      mode = "n";
      options = {
        silent = true;
        desc = "Close other windows";
      };
      action = ":only<CR>";
    }
    {
      key = "<leader>wr";
      mode = "n";
      options = {
        silent = true;
        desc = "Rotate windows";
      };
      action = ":wincmd r<CR>";
    }

    # Tab navigation (prefix <leader>T)
    {
      key = "<leader>T";
      mode = "n";
      options = {
        silent = true;
        desc = "tab";
      };
      action = "<nop>";
    }
    {
      key = "<leader>Tn";
      mode = "n";
      options = {
        silent = true;
        desc = "New tab";
      };
      action = ":tabnew<CR>";
    }
    {
      key = "<leader>Tc";
      mode = "n";
      options = {
        silent = true;
        desc = "Close tab";
      };
      action = ":tabclose<CR>";
    }
    {
      key = ";T";
      mode = "n";
      options = {
        silent = true;
        desc = "Next tab";
      };
      action = ":tabnext<CR>";
    }
    {
      key = ",T";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous tab";
      };
      action = ":tabprev<CR>";
    }
    {
      key = "<leader>Tt";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to tab 1-9";
      };
      action = ":tabfirst<CR>";
    }
    {
      key = "<leader>T1";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to tab 1";
      };
      action = "1gt";
    }
    {
      key = "<leader>T2";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to tab 2";
      };
      action = "2gt";
    }
    {
      key = "<leader>T3";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to tab 3";
      };
      action = "3gt";
    }
    {
      key = "<leader>T4";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to tab 4";
      };
      action = "4gt";
    }
    {
      key = "<leader>T5";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to tab 5";
      };
      action = "5gt";
    }
    {
      key = "<leader>T6";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to tab 6";
      };
      action = "6gt";
    }
    {
      key = "<leader>T7";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to tab 7";
      };
      action = "7gt";
    }
    {
      key = "<leader>T8";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to tab 8";
      };
      action = "8gt";
    }
    {
      key = "<leader>T9";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to tab 9";
      };
      action = "9gt";
    }

    # Enhanced diagnostics
    {
      key = "<leader>le";
      mode = "n";
      options = {
        silent = true;
        desc = "Show line diagnostics";
      };
      action.__raw = "function() vim.diagnostic.open_float() end";
    }
    {
      key = ";e";
      mode = "n";
      options = {
        silent = true;
        desc = "Next error diagnostic";
      };
      action.__raw = "function() vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR}) end";
    }
    {
      key = ",e";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous error diagnostic";
      };
      action.__raw = "function() vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR}) end";
    }
    {
      key = ";w";
      mode = "n";
      options = {
        silent = true;
        desc = "Next warning diagnostic";
      };
      action.__raw = "function() vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN}) end";
    }
    {
      key = ",w";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous warning diagnostic";
      };
      action.__raw = "function() vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN}) end";
    }

    # File operations
    {
      key = "<leader>fn";
      mode = "n";
      options = {
        silent = true;
        desc = "New file";
      };
      action = ":enew<CR>";
    }
    {
      key = "<leader>fR";
      mode = "n";
      options = {
        silent = true;
        desc = "Rename current file";
      };
      action.__raw = "function() local old_name = vim.api.nvim_buf_get_name(0); local new_name = vim.fn.input('New name: ', old_name, 'file'); if new_name ~= '' and new_name ~= old_name then vim.cmd('saveas ' .. new_name); vim.cmd('silent! !rm ' .. old_name); print('Renamed to ' .. new_name); end end";
    }

    # Text operations
    {
      key = "<leader>sy";
      mode = "v";
      options = {
        silent = true;
        desc = "Copy to system clipboard";
      };
      action = "\"+y";
    }
    {
      key = "<leader>sY";
      mode = "v";
      options = {
        silent = true;
        desc = "Copy line to system clipboard";
      };
      action = "\"+yy";
    }
    {
      key = "<leader>sp";
      mode = "v";
      options = {
        silent = true;
        desc = "Paste from system clipboard";
      };
      action = "\"+p";
    }
    {
      key = "<leader>sP";
      mode = "v";
      options = {
        silent = true;
        desc = "Paste from system clipboard (before)";
      };
      action = "\"+P";
    }

    # Location list navigation
    {
      key = ";l";
      mode = "n";
      options = {
        silent = true;
        desc = "Next location";
      };
      action = ":lnext<CR>";
    }
    {
      key = ",l";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous location";
      };
      action = ":lprev<CR>";
    }
    {
      key = "<leader>lo";
      mode = "n";
      options = {
        silent = true;
        desc = "Open location list";
      };
      action = ":lopen<CR>";
    }
    {
      key = "<leader>lc";
      mode = "n";
      options = {
        silent = true;
        desc = "Close location list";
      };
      action = ":lclose<CR>";
    }

    # Git blame (additional)
    {
      key = "<leader>gb";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle blame";
      };
      action.__raw = "function() vim.cmd('Gitsigns toggle_current_line_blame') end";
    }

    # Quick command
    {
      key = "<leader>;";
      mode = "n";
      options = {
        silent = true;
        desc = "Command palette";
      };
      action = ":Telescope commands<CR>";
    }

    # Search history
    {
      key = "<leader>fh";
      mode = "n";
      options = {
        silent = true;
        desc = "Search history";
      };
      action = ":Telescope search_history<CR>";
    }
    {
      key = "<leader>f:";
      mode = "n";
      options = {
        silent = true;
        desc = "Command history";
      };
      action = ":Telescope command_history<CR>";
    }

    # Jumps navigation
    {
      key = "<leader>j";
      mode = "n";
      options = {
        silent = true;
        desc = "jumplist";
      };
      action = "<nop>";
    }
    {
      key = ";j";
      mode = "n";
      options = {
        silent = true;
        desc = "Next jump";
      };
      action = "<C-i>";
    }
    {
      key = ",j";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous jump";
      };
      action = "<C-o>";
    }

    # Marks navigation
    {
      key = "<leader>m";
      mode = "n";
      options = {
        silent = true;
        desc = "marks";
      };
      action = "<nop>";
    }
    {
      key = "<leader>ms";
      mode = "n";
      options = {
        silent = true;
        desc = "Set mark";
      };
      action = "m";
    }
    {
      key = "<leader>mm";
      mode = "n";
      options = {
        silent = true;
        desc = "Show marks";
      };
      action = ":Telescope marks<CR>";
    }
    {
      key = ";m";
      mode = "n";
      options = {
        silent = true;
        desc = "Next mark";
      };
      action = "']";
    }
    {
      key = ",m";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous mark";
      };
      action = "'[";
    }

    # File type specific (for Nix files)
    {
      key = "<leader>ffn";
      mode = "n";
      options = {
        silent = true;
        desc = "Find files in NixOS config";
      };
      action = ":Telescope find_files cwd=${config.nixosConfigPath}<CR>";
    }

    # ==================== ORGANIZE/REFACTOR KEYMAPS ====================
    # Global code organization (works for all languages)
    {
      key = "<leader>o";
      mode = "n";
      options = {
        silent = true;
        desc = "organize";
      };
      action = "<nop>";
    }
    # Organize imports (language-aware)
    {
      key = "<leader>oi";
      mode = "n";
      options = {
        silent = true;
        desc = "Organize imports";
      };
      action.__raw = "function() local ft = vim.bo.filetype if ft == 'python' then vim.cmd('!ruff check --select I --fix %') elseif ft == 'lua' then vim.cmd('!stylua %') elseif ft:match('javascript') or ft:match('typescript') then vim.cmd('!eslint --fix %') else print('No organize imports for ' .. ft) end end";
    }
    # Fix/Check current file
    {
      key = "<leader>of";
      mode = "n";
      options = {
        silent = true;
        desc = "Fix file (lint fix)";
      };
      action.__raw = "function() local ft = vim.bo.filetype if ft == 'python' then vim.cmd('!ruff check --fix %') elseif ft == 'lua' then vim.cmd('!stylua %') elseif ft == 'nix' then vim.cmd('!nixfmt %') elseif ft:match('javascript') or ft:match('typescript') or ft == 'json' or ft == 'markdown' then vim.cmd('!prettier --write %') else print('No fix for ' .. ft) end end";
    }
    # Check file (lint)
    {
      key = "<leader>oc";
      mode = "n";
      options = {
        silent = true;
        desc = "Check file (lint)";
      };
      action.__raw = "function() local ft = vim.bo.filetype if ft == 'python' then vim.cmd('!ruff check %') elseif ft == 'lua' then vim.cmd('!selene %') elseif ft == 'nix' then vim.cmd('!deadnix %') else print('No check for ' .. ft) end end";
    }
    # Run file (language-aware)
    {
      key = "<leader>or";
      mode = "n";
      options = {
        silent = true;
        desc = "Run file";
      };
      action.__raw = "function() local ft = vim.bo.filetype local cmd if ft == 'python' then cmd = 'python' elseif ft == 'lua' then cmd = 'lua' elseif ft == 'sh' or ft == 'bash' then cmd = 'bash' elseif ft == 'javascript' then cmd = 'node' elseif ft:match('typescript') then cmd = 'tsx' else cmd = nil end if cmd then vim.cmd('term ' .. cmd .. ' %') else print('Cannot run ' .. ft .. ' files') end end";
    }
    # Toggle inlay hints (global)
    {
      key = "<leader>oh";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle inlay hints";
      };
      action.__raw = "function() vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(0)) end";
    }

    # ==================== QUICK ACTIONS ====================
    # Quick format (uses conform-nvim)
    {
      key = "<leader>qf";
      mode = "n";
      options = {
        silent = true;
        desc = "Quick format buffer";
      };
      action.__raw = "function() require('conform').format({ async = true, lsp_fallback = true }) end";
    }
    # Quick format visual selection
    {
      key = "<leader>qf";
      mode = "v";
      options = {
        silent = true;
        desc = "Quick format selection";
      };
      action.__raw = "function() require('conform').format({ async = true, lsp_fallback = true }) end";
    }
  ];
}
