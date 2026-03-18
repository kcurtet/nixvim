{
  plugins = {
    # Enhanced LSP UI with code actions, hover, diagnostics
    lspsaga = {
      enable = true;
      settings = {
        # Code action lightbulb - disable if lspsaga handles it
        lightbulb = {
          enable = false;
          sign = false;
        };

        # Preview options
        preview = {
          lines_above = 0;
          lines_below = 10;
        };

        # Code action window
        code_action = {
          show_server_name = true;
          extend_gitsigns = false;
          only_in_cursor = true;
        };

        # Finder/Telescope integration
        finder = {
          layout = "float";
          silent = true;
        };

        # Rename popup
        rename = {
          in_select = true;
          auto_save = false;
          whole_project = false;
        };

        # UI theme
        ui = {
          border = "rounded";
          title = false;
          winblend = 10;
        };
      };
    };
  };
}
