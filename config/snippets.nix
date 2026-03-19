{
  config,
  pkgs,
  ...
}:
{
  plugins = {
    # Snippet engine
    luasnip = {
      enable = true;
      luaConfig.content = ''
        require("luasnip.loaders.from_vscode").load({
          paths = {
            "${pkgs.vimPlugins.friendly-snippets}",
          },
        })
      '';
    };
  };
}
