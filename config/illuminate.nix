{
  # vim-illuminate - Highlight other uses of the word under cursor
  plugins.vim-illuminate = {
    enable = true;
    settings = {
      delay = 100;
      large_file_cutoff = 2000;
      large_file_overrides = {
        providers = {
          "lsp" = false;
          "treesitter" = { "enable" = false; "keywords" = false; };
        };
      };
      min_count_to_highlight = 3;
      filetypes_denylist = {
        "dirbuf" = true;
        "dirvish" = true;
        "fugitive" = true;
      };
      modes_denylist = {
        "c" = true;
      };
      providers = {
        "lsp" = true;
        "treesitter" = true;
        "regex" = true;
      };
    };
  };
}
