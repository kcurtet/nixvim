{
  plugins = {
    codecompanion = {
      enable = true;

      # Settings for the main plugin
      settings = {
        keymaps = {
          send = "<leader>ca";  # Send code to AI
          send_file = "<leader>cf";  # Send current file to AI
          send_selection = "<leader>cs";  # Send selection to AI
          close = "<leader>cc";  # Close chat
        };

        # Suggestion settings
        diff = {
          enabled = true;
          switch = false;
        };
      };

      # Lua configuration
      luaConfig.content = ''
        require("codecompanion").setup({
          adapters = {
            -- Default to local Ollama model (add OpenAI or other adapters as needed)
            openai = "local",  -- Uses Ollama with local models
          },
          strategies = {
            chat = {
              adapter = "openai",
            },
            inline = {
              adapter = "openai",
            },
          },
          tools = {
            diff = {
              enabled = true,
            },
          },
        })
      '';
    };
  };
}
