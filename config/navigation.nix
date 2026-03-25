{
  plugins = {
    oil.enable = true;
    neo-tree.enable = true;
    telescope = {
      enable = true;
    };
    flash.enable = true;

    # Harpoon2 - Quick file navigation
    harpoon = {
      enable = true;
      enableTelescope = true;
      luaConfig.content = ''
        require("harpoon"):setup({
          settings = {
            save_on_toggle = true,
            sync_on_ui_close = false,
          }
        })
      '';
    };
  };
}
