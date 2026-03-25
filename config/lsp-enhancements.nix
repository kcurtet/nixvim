{
  plugins = {
    # Incremental LSP rename with preview
    inc-rename = {
      enable = true;
      settings = {
        # Input in command line
        input_default = "renaming";
        # Don't show empty messages
        show_empty = false;
      };
    };

    # Preview definitions in floating window
    goto-preview = {
      enable = true;

      settings = {
        # Window size
        width = 120;
        height = 15;
        # Border style
        border = "rounded";
        # Default mappings
        default_mappings = {
          close = "<Esc>";
        };
        # Ignore file types for preview
        ignore_files = [
          "node_modules/*"
          "target/*"
        ];
      };
    };
  };
}
