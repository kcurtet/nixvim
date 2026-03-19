{
  # Trouble - Better diagnostics, quickfix, and references UI
  plugins.trouble = {
    enable = true;
    settings = {
      auto_close = true;
      auto_preview = true;
      focus = true;
      restore = true;
      follow = true;
      indent_guides = true;
      max_items = 200;
      warn_no_results = false;
      open_no_results = true;
      win = {
        size = {
          height = 10;
          width = 50;
        };
        position = "bottom";
        wo = {
          winbar = "";
          winfixwidth = true;
          winfixheight = true;
        };
      };
    };
  };
}
