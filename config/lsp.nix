{
  config,
  pkgs,
  lib,
  ...
}: {
  plugins.lsp = {
    enable = true;
    servers = {
      ts_ls.enable = true;
      lua_ls.enable = true;
      jsonls.enable = true;
      pyright = {
        enable = true;
        settings = {
          python.analysis = {
            autoSearchPaths = true;
            diagnosticMode = "openFilesOnly";
            useLibraryCodeForTypes = true;
            typeCheckingMode = "standard";
            inlayHints = {
              variableTypes = true;
              functionReturnTypes = true;
              callArgumentNames = true;
            };
          };
        };
      };
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      nixd = let
        configPath = "(builtins.getFlake \"${config.nixosConfigPath}\")";
      in {
        enable = true;
        settings = {
          nixpkgs = {
            expr = "import ${configPath}.inputs.nixpkgs { }";
          };
          formatting = {
            command = ["nixfmt"];
          };
          options = {
            nixos = {
              expr = "${configPath}.nixosConfigurations.panther.options";
            };
            home-manager = {
              expr = "${configPath}.nixosConfigurations.panther.options.home-manager.users.type.getSubOptions []";
            };
          };
        };
      };
    };
    keymaps = {
      silent = true;
      lspBuf = {
        gd = {
          action = "definition";
          desc = "Go to definition";
        };
        gD = {
          action = "declaration";
          desc = "Go to declaration";
        };
        gi = {
          action = "implementation";
          desc = "Go to implementation";
        };
        gr = {
          action = "references";
          desc = "Go to references";
        };
        gt = {
          action = "type_definition";
          desc = "Go to type definition";
        };
        K = {
          action = "hover";
          desc = "Hover documentation";
        };
        "<C-k>" = {
          action = "signature_help";
          desc = "Signature help";
        };
        "<leader>la" = {
          action = "code_action";
          desc = "Code action";
        };
        "<leader>ln" = {
          action = "rename";
          desc = "Rename symbol";
        };
        "<leader>lf" = {
          action = "format";
          desc = "Format buffer";
        };
        # Enhanced LSP keymaps
        "<leader>lh" = {
          action = "hover";
          desc = "Hover documentation";
        };
        "<leader>lD" = {
          action = "declaration";
          desc = "Go to declaration";
        };
        "<leader>lt" = {
          action = "type_definition";
          desc = "Go to type definition";
        };
        "<leader>li" = {
          action = "implementation";
          desc = "Go to implementation";
        };
      };
      diagnostic = {
        ",d" = {
          action = "goto_prev";
          desc = "Previous diagnostic";
        };
        ";d" = {
          action = "goto_next";
          desc = "Next diagnostic";
        };
        "<leader>lq" = {
          action = "setqflist";
          desc = "Diagnostics to quickfix";
        };
        "<leader>ll" = {
          action = "open_float";
          desc = "Line diagnostics";
        };
      };
    };
  };
}
