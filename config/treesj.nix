{
  plugins = {
    # Split/join code blocks (JS objects, function args, arrays, etc.)
    treesj = {
      enable = true;
      settings = {
        # Max length for joined line
        max_join_length = 150;
        # Use Treesitter for better detection
        use_treesitter = true;
      };
    };
  };
}
