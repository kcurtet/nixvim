{
  colorschemes.nord.enable = true;

  extraConfigLua = ''
    require("transparent").clear_prefix("BufferLine") -- Clear the "BufferLine" prefix from the list of groups to make them transparent
    require("transparent").clear_prefix("WinBar")
    require("transparent").clear_prefix("lualine")
    require("transparent").clear_prefix("WhichKey")
  '';

  plugins = {
    transparent = {
      enable = true;
      settings = {
        extra_groups = [
          "NormalFloat"
        ];
      };
    };
    rainbow-delimiters.enable = true;
    colorizer.enable = true;
    fidget.enable = true;
    noice = {
      enable = true;
      settings = {
        routes = [
          {
            filter = {
              event = "msg_show";
              find = "vim.lsp.util.convert_input_to_markdown_lines";
            };
            opts = {
              skip = true;
            };
          }
          {
            filter = {
              event = "msg_show";
              find = "vim.lsp.util.stylize_markdown";
            };
            opts = {
              skip = true;
            };
          }
          {
            filter = {
              event = "msg_show";
              find = "cmp.entry.get_documentation";
            };
            opts = {
              skip = true;
            };
          }
        ];
      };
    };

    which-key.enable = true;
    lualine.enable = true;
    web-devicons.enable = true;
  };
}
