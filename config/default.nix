{
  # Import all your configuration modules here
  imports = [
    ./nixos-path.nix
    ./system.nix
    ./options.nix
    ./dependencies.nix
    ./editor.nix
    ./ui.nix
    ./bufferline.nix
    ./mini.nix
    ./snippets.nix
    ./substitute.nix
    ./treesj.nix
    ./lspsaga.nix
    ./lsp-enhancements.nix
    ./session.nix
    ./git-enhancements.nix
    ./qol.nix
    ./indent.nix
    ./keymaps.nix
    ./navigation.nix
    ./treesit.nix
    ./lsp.nix
    ./lint.nix
    ./dap.nix
    ./cmp.nix
    ./format.nix
    ./term.nix
    ./obsidian.nix
    ./snacks.nix
    ./codecompanion.nix
    ./copilot.nix
    # New modules
    ./todo.nix
    ./trouble.nix
    # ./telescope-addons.nix  # Extensions not packaged in nixvim
    # ./illuminate.nix  # Not packaged in nixvim
    ./indent-blankline.nix
    ./spectre.nix
    ./yanky.nix
    ./grug-far.nix
    # ./focus.nix  # Not packaged in nixvim
    ./tmux-zellij.nix
    # ./ai-enhancements.nix  # gen.nvim not packaged in nixvim
  ];
}
