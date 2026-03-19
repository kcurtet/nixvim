{
  # spectre.nvim - Advanced search and replace
  plugins.spectre = {
    enable = true;
    settings = {
      color_devicons = true;
      open_cmd = "neo-tree";
      live_update = false;
      highlight = {
        search = "Search";
        replace = "Replace";
      };
      # keymaps configured separately in keymaps.nix
      find_engine = {
        rg = {
          cmd = "rg";
          args = [
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
          ];
          options = { };
        };
      };
      default = {
        find = {
          cmd = "rg";
          options = [];
        };
        replace = {
          cmd = "sed";
        };
      };
      replace_vim_cmd = "sed";
    };
  };
}
