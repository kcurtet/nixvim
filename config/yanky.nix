{
  # yanky.nvim - Improved yank/paste history
  plugins = {
    yanky = {
      enable = true;
      settings = {
        highlight = {
          on_put = true;
          on_yank = true;
          timer = 200;
        };
        ring = {
          history_length = 100;
          storage = "shada";
          sync_with_numbered_registers = true;
          cancel_event = "update";
        };
        picker = {
          select = {
            action = "put";
          };
          # telescope mappings configured in keymaps.nix
        };
        system_clipboard = {
          sync_with_ring = true;
        };
      };
    };
    # Required dependency for yanky
    telescope.settings = {
      extensions = {
        yank_history = { };
      };
    };
  };
}
