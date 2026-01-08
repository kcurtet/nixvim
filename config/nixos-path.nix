{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    nixosConfigPath = lib.mkOption {
      type = lib.types.str;
      default = "/home/kx/.config/nixos";
      description = "Path to NixOS configuration for nixd LSP";
    };
    
    nixvimConfigPath = lib.mkOption {
      type = lib.types.str;
      default = "/home/kx/Code/nixvim";
      description = "Path to NixVim configuration";
    };
  };
}