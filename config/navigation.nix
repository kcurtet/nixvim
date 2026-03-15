{
  plugins = {
    neo-tree.enable = true;
    telescope = {
      enable = true;
      enabledExtensions = [ "harpoon" ];
    };
    flash.enable = true;
    project-nvim.enable = true;

    # Harpoon2 - Quick file navigation
    harpoon = {
      enable = true;
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
