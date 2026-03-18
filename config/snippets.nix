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
      # Add friendly-snippets collection
      fromVscode = [ pkgs.vimPlugins.friendly-snippets ];
    };
  };
}
