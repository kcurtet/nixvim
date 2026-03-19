{
  # TMUX and Zellij integration
  plugins = {
    # tmux.nvim - Navigate between tmux panes and vim splits seamlessly
    tmux-navigator = {
      enable = true;
      settings = {
        no_mappings = 0;
        keymaps = {
          left = "<C-h>";
          down = "<C-j>";
          up = "<C-k>";
          right = "<C-l>";
        };
      };
    };

    # zellij.vim - Better integration with Zellij
    zellij = {
      enable = true;
      settings = {
        bindings = {
          suffix = "<C-z>";
          prefix = "<leader>z";
        };
      };
    };
  };
}
