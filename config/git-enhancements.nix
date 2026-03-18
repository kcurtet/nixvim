{
  plugins = {
    # Better merge conflict handling
    git-conflict = {
      enable = true;
      settings = {
        # Default mappings
        default_mappings = {
          ours = "co";
          theirs = "ct";
          none = "n";
          both = "b";
          next = "]";
          prev = "[";
        };
        # Highlight conflicts
        highlights = {
          incoming = "DiffAdd";
          current = "DiffChange";
        };
      };
    };
  };
}
