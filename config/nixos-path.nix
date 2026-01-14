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

  config = {
    autoCmd = [
      {
        event = ["BufWritePost"];
        pattern = [
          "${config.nixvimConfigPath}/*.nix"
          "${config.nixvimConfigPath}/**/*.nix"
        ];
        callback = {
          __raw = ''
            function()
                vim.g.nix_files_modified = true
                print("Running git commit on ${config.nixvimConfigPath}...")
                vim.fn.system("pushd ${config.nixvimConfigPath}; git commit -am $(date +%s)-switch; git push; popd")
            end
          '';
        };
      }
      {
        event = ["VimLeavePre"];
        callback = {
          __raw = ''
            function()
              if vim.g.nix_files_modified then
                print("Running nixos-rebuild switch...")
                vim.fn.system("nswitch")
              end
            end
          '';
        };
      }
    ];
  };
}
