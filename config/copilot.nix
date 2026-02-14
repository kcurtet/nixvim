{
  plugins = {
    copilot-lua = {
      enable = true;
      luaConfig.content = ''
        require('copilot').setup({
          panel = {
            enabled = true,
            auto_refresh = true,
            keymap = {
              jump_prev = '[[',
              jump_next = ']]',
              accept = '<CR>',
              refresh = 'gr',
              open = '<M-CR>'
            },
          },
          suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
              accept = '<M-l>',
              accept_word = false,
              accept_line = false,
              next = '<M-]>',

              prev = '<M-[>',
              dismiss = '<C-]>',
            },
          },
        })
      '';
    };
  };
}
