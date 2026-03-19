{
  description = "A Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = inputs@{ self, flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      imports = [ inputs.nixvim.flakeModules.default ];

      perSystem = { system, config, self', inputs', pkgs, ... }: {
        packages = {
          default = inputs'.nixvim.legacyPackages.makeNixvimWithModule {
            # Pass a configured nixpkgs instance with allowUnfree
            pkgs = import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
            extraSpecialArgs = {
              nixosConfigPath = "/home/kx/system/nixos-config";
              nixvimConfigPath = "/home/kx/code/projects/personal/nixvim";
            };
            module = {
              imports = [ ./config ];
            };
          };
        };

        nixvimConfigurations.default = inputs.nixvim.lib.evalNixvim {
          inherit system;
          modules = [
            ./config
            {
              nixosConfigPath = "/home/kx/system/nixos-config";
              nixvimConfigPath = "/home/kx/code/projects/personal/nixvim";
            }
          ];
        };

        devShells.default = pkgs.mkShell {
          buildInputs = [ self'.packages.default pkgs.nixpkgs-fmt ];

          shellHook = ''
            echo "✓ Nixvim development shell loaded"
            echo "  Run 'nvim' to start Neovim with this configuration"
          '';
        };

        checks = {
          # Test that Neovim starts without errors
          nixvim-startup-test = pkgs.runCommand "nixvim-startup-test" {
            nativeBuildInputs = [ self'.packages.default ];
          } ''
            export HOME=$(mktemp -d)
            mkdir -p "$HOME/.local/state/nvim"

            # Test basic startup - should exit with code 0
            ${self'.packages.default}/bin/nvim --headless -c 'qa!' 2>&1 > $out

            # Check for Lua errors
            if grep -qi "error" $out; then
              echo "ERROR: Lua errors detected during startup"
              cat $out
              exit 1
            fi

            echo "✓ Neovim starts without errors" > $out
          '';

          # Test that messages are clean (no warnings)
          nixvim-messages-test = pkgs.runCommand "nixvim-messages-test" {
            nativeBuildInputs = [ self'.packages.default ];
          } ''
            export HOME=$(mktemp -d)
            mkdir -p "$HOME/.local/state/nvim"

            # Check messages output
            ${self'.packages.default}/bin/nvim --headless \
              -c 'lua print("=== MESSAGES ===\n" .. vim.api.nvim_exec2("messages", {output=true}).output)' \
              -c 'qa!' 2>&1 > messages

            # Check for warnings (excluding benign ones)
            if grep -i "WARN" messages | grep -v "sessionoptions\|lazy.stats" > /dev/null; then
              echo "WARNING: Unexpected warnings in messages"
              cat messages
              exit 1
            fi

            echo "✓ No unexpected warnings" > $out
          '';

          # Test LSP servers can be loaded
          nixvim-lsp-test = pkgs.runCommand "nixvim-lsp-test" {
            nativeBuildInputs = [ self'.packages.default ];
          } ''
            export HOME=$(mktemp -d)
            mkdir -p "$HOME/.local/state/nvim"

            # Create a test file that triggers LSP
            echo 'print("hello")' > test.lua

            # Test LSP config loads without errors
            ${self'.packages.default}/bin/nvim --headless test.lua \
              -c 'lua local ok, err = pcall(function() require("lspconfig") end); print(ok and "LSP config OK" or "LSP config ERROR: " .. tostring(err))' \
              -c 'qa!' 2>&1 | tee lsp-output

            if ! grep -q "LSP config OK" lsp-output; then
              echo "ERROR: LSP config failed to load"
              cat lsp-output
              exit 1
            fi

            echo "✓ LSP configuration loads correctly" > $out
          '';

          # Test keymaps are valid
          nixvim-keymaps-test = pkgs.runCommand "nixvim-keymaps-test" {
            nativeBuildInputs = [ self'.packages.default ];
          } ''
            export HOME=$(mktemp -d)
            mkdir -p "$HOME/.local/state/nvim"

            # List all keymaps and check for errors
            ${self'.packages.default}/bin/nvim --headless \
              -c 'lua local maps = vim.api.nvim_get_keymap("n"); print("Keymaps: " .. #maps); for _, m in ipairs(maps) do print(m.lhs .. " -> " .. (m.rhs or "[special]")) end' \
              -c 'qa!' 2>&1 > keymap-output

            if grep -qi "error" keymap-output; then
              echo "ERROR: Keymap errors detected"
              cat keymap-output
              exit 1
            fi

            echo "✓ Keymaps configured correctly" > $out
          '';
        };
      };
    };
}
