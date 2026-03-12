{
  plugins = {
    # Comments
    comment.enable = true;

    # Pairs
    nvim-autopairs.enable = true;

    vim-surround.enable = true;
    smart-splits.enable = true;
    diffview = {
      enable = true;
      lazyLoad.settings = {
        cmd = "DiffviewOpen";
      };
    };

    neogit.enable = true;

    gitsigns = {
      enable = true;
      settings.diff_opts = {
        internal = true;
      };
    };
  };
}
