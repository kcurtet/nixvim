{
  config,
  pkgs,
  lib,
  ...
}:
{
  plugins.lint = {
    enable = true;

    lintersByFt = {
      # Python linter
      python = [ "ruff" ];

      # TypeScript/JavaScript linter
      typescript = [ "eslint" ];
      javascript = [ "eslint" ];
      typescriptreact = [ "eslint" ];
      javascriptreact = [ "eslint" ];

      # Lua linter
      lua = [ "selene" ];

      # Nix linter
      nix = [
        "deadnix"
        "statix"
      ];
    };
  };
}
