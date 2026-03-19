{
  # Telescope extensions for undo and file browser
  plugins = {
    telescope = {
      enabledExtensions = [
        "undo"
        "file_browser"
      ];
    };

    # Telescope Undo - Browse undo history
    telescope-undo = {
      enable = true;
      settings = {
        theme = "dropdown";
        mappings = {
          i = {
            "<cr>" = "require('telescope-undo.actions').yank_additions";
            "<S-cr>" = "require('telescope-undo.actions').yank_deletions";
            "<C-cr>" = "require('telescope-undo.actions').restore";
          };
          n = {
            "y" = "require('telescope-undo.actions').yank_additions";
            "Y" = "require('telescope-undo.actions').yank_deletions";
            "u" = "require('telescope-undo.actions').restore";
          };
        };
      };
    };

    # Telescope File Browser - Browse files like a tree
    telescope-file-browser = {
      enable = true;
      settings = {
        theme = "ivy";
        hijack_netrw = true;
        mappings = {
          i = {
            "<C-w>" = "require('telescope.actions').delete_buffer";
          };
          n = {
            "h" = "require('telescope._extensions.file_browser.actions').toggle_hidden";
            "/" = "require('telescope._extensions.file_browser.actions').toggle_browser";
          };
        };
      };
    };
  };
}
