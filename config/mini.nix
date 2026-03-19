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
