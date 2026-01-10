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
    extraConfigLua = ''
      local nix_files_modified = false

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = {
            "/etc/nixos/*.nix",
            "/etc/nixos/**/*.nix",
            "${config.nixvimConfigPath}/**/*.nix",
            "${config.nixosConfigPath}/**/*.nix",
          },
          callback = function()
            nix_files_modified = true
          end,
        })

        vim.api.nvim_create_autocmd("VimLeavePre", {
          callback = function()
            if nix_files_modified then
              print("Running nixos-rebuild switch...")
              vim.fn.system("pushd ${config.nixvimConfigPath}; git commit -am $(date +%s)-switch; git push; popd")
              vim.fn.system("pushd ${config.nixvimConfigPath}; git commit -am $(date +%s)-switch; git push; popd")
              vim.fn.system("sudo nixos-rebuild switch")
            end
          end,
        })
    '';
  };
}

