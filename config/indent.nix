{
  plugins = {
    # Visual indentation guides
    indent-blankline = {
      enable = true;
      settings = {
        # Character to use for indent lines
        char = "┊";
        # Character for blank line indent
        char_list_blank_space = "┊";
        # Character for blank line end
        space_char_blankline = " ";
        # Show context of current indentation
        show_current_context = true;
        # Don't show trailing blankline indent (cleaner look)
        show_trailing_blankline_indent = false;
        # Use Treesitter for better performance
        use_treesitter = true;
        # Context highlight
        context_highlight = {
          default_indent = "IndentContext";
          indent_policy = "outer";
        };
      };
    };
  };
}
