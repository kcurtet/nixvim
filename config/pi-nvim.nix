{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    pi-nvim
  ];
}
