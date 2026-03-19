{
  # focus.nvim - Auto-resize the focused window
  # Note: Not packaged in nixvim - needs manual installation via extraPlugins
  plugins.focus = {
    enable = false;
    settings = {
      enable = true;
      autoresize = {
        enable = true;
        minwidth = 30;
        minheight = 10;
        height_shorten = 1;
        width_shorten = 1;
      };
      tmux = {
        enable = true;
        prefix = "";
      };
      compatible = "tree";
    };
  };
}
