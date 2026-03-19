{
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enable = true;
      dashboard = {
        enable = false;
        enabled = false;  # Fully disable to prevent lazy.stats dependency
      };
      input.enable = true;
      notifier = {
        enable = false;  # Disabled - using noice.nvim for notifications
        timeout = 3000;
      };
      picker.enable = true;
      quickfile.enable = true;
      statuscolumn.enable = true;
      terminal.enable = true;
      words.enable = true;
      lazygit.enable = true;
      indent = {
        enable = true;
        animate.enable = true;
      };
    };
  };
}
