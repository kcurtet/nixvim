{
  config,
  pkgs,
  ...
}: {
  viAlias = true;
  vimAlias = true;
  enableMan = false;
  enablePrintInit = true; # nixvim-print-init tool

  clipboard.providers.wl-copy.enable = true;
  clipboard.providers.xclip.enable = false;

  # All external packages for LSPs, formatters, and linters
  extraPackages = with pkgs; [
    # Formatters
    nixfmt
    stylua
    biome
    shfmt

    # LSPs (built-in: ts_ls, lua_ls, jsonls, pyright, rust_analyzer, nixd)
    # These are included by nixvim, but some need external tools
    nodePackages_latest.typescript-language-server
    lua-language-server
    nodePackages_latest.vscode-langservers-extracted # jsonls
    python312Packages.python-lsp-server
    rust-analyzer
    cargo
    rustc
    nixd

    # Linters
    selene
    deadnix
    statix
    nodePackages_latest.eslint

    # Python
    ruff

    # Search and replace tools
    ripgrep
    gnused

    # AI (if using ollama)
    # ollama  # Uncomment if you have ollama installed
  ];

  extraPlugins = with pkgs.vimPlugins; [
    opencode-nvim
  ];
}
