{
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          nix = ["alejandra"];
          lua = ["stylua"];
          json = ["prettier"];
          python = ["black"];
          rust = ["rustfmt"];
          javascript = ["prettier"];
          typescript = ["prettier"];
          markdown = ["prettier"];
        };
        format_on_save = ''
          function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end
            return { timeout_ms = 1000, lsp_fallback = true }
          end
        '';
      };
    };
  };

  userCommands = {
    FormatDisable = {
      command.__raw = ''
        function(args)
          if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
          else
            vim.g.disable_autoformat = true
          end
        end
      '';
      bang = true;
      desc = "Disable autoformat-on-save";
    };
    FormatEnable = {
      command.__raw = ''
        function(args)
          if args.bang then
            -- FormatEnable! will enable formatting just for this buffer
            vim.b.disable_autoformat = false
          else
            vim.g.disable_autoformat = false
          end
        end
      '';
      bang = true;
      desc = "Enable autoformat-on-save";
    };
    FormatToggle = {
      command.__raw = ''
        function(args)
          if args.bang then
            -- FormatToggle! will toggle formatting for this buffer
            vim.b.disable_autoformat = not vim.b.disable_autoformat
          else
            vim.g.disable_autoformat = not vim.g.disable_autoformat
          end
        end
      '';
      bang = true;
      desc = "Toggle autoformat-on-save";
    };
  };
}
