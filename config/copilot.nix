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
              jump_prev = 'k',
              jump_next = 'j',
              accept = 'l',
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
              next = '<M-j>',
              prev = '<M-k>',
              dismiss = '<M-d>',
            },
          },
        })
      '';
    };
  };
}
