{
  config,
  pkgs,
  lib,
  ...
}:
{
  options = {
    nixosConfigPath = lib.mkOption {
      type = lib.types.str;
      default = "/home/kx/system/nixos-config";
      description = "Path to NixOS configuration for nixd LSP";
    };

    nixvimConfigPath = lib.mkOption {
      type = lib.types.str;
      default = "/home/kx/code/projects/personal/nixvim";
      description = "Path to NixVim configuration";
    };
  };
}
