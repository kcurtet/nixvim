{
  config,
  pkgs,
  lib,
  ...
}:
{
  plugins = {
    mini = {
      enable = true;
      modules = {
        # Enhanced text objects - game-changing productivity boost
        ai = {
          enable = true;
          settings = {
            # Number of lines to search for text object
            n_lines = 50;
            # Custom textobjects that extend 'a' (around) and 'i' (inside)
            custom_textobjects = {
              # Around operators: ao, ai, an, aa (around next/prev/all)
              o = ["ao", "ai", "an", "ao", "aa"];
              # Inside operators: ai, an, ao (inside next/prev/all)
              i = ["ai", "an", "ao"];
              # Function operators: af, if, ao (around next/prev/all function)
              f = ["af", "if", "ao"];
            };
          };
        };

        # Surround actions - can replace vim-surround
        surround = {
          enable = true;
          settings = {
            mappings = {
              # Default mini.surround mappings
              add = "sa";
              delete = "sd";
              find = "sf";
              find_left = "sF";
              replace = "sr";
            };
          };
        };

        # Autopairs alternative
        pairs = {
          enable = true;
        };

        # Better bracket navigation
        bracketed = {
          enable = true;
        };

        # Comment lines - can replace comment.nvim
        comment = {
          enable = true;
          settings = {
            hooks = {
              # Comment blank line below
              pre = "__comment.fn_hook.__pre()";
              # Uncomment blank line above
              post = "__comment.fn_hook.__post()";
            };
          };
        };

        # Move selections in any direction
        move = {
          enable = true;
        };

        # Splitjoin - alternative to treesj
        splitjoin = {
          enable = true;
        };
      };
    };
  };
}
