{
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
        desc = "Find files in config";
      };
      action = ":Telescope find_files cwd=~/config<CR>";
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
      key = "]t";
      mode = "n";
      options = {
        silent = true;
        desc = "Next todo comment";
      };
      action.__raw = "function() require('todo-comments').jump_next() end";
    }
    {
      key = "[t";
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
      key = "]h";
      mode = "n";
      options = {
        silent = true;
        desc = "Next hunk";
      };
      action.__raw = "function() require('gitsigns').next_hunk() end";
    }
    {
      key = "[h";
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
  ];
}
