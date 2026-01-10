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
              vim.g.nixvim_files_modified = true
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
                vim.fn.system("pushd ${config.nixvimConfigPath}; git commit -am \"$(date +%s)-switch\"; git push; popd")
                vim.fn.system("popd ${config.nixosConfigPath}; nix flake update nixvim; popd")
                vim.fn.system("nswitch")
              end
            end
          '';
        };
      }
    ];
  };
}
