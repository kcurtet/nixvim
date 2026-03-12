{
  plugins = {
    render-markdown.enable = true; # Enable markdown rendering for better AI responses
    codecompanion = {
      enable = true;

      # Settings for the main plugin
      settings = {
        keymaps = {
          send = "<leader>ca"; # Send code to AI
          send_file = "<leader>cf"; # Send current file to AI
          send_selection = "<leader>cs"; # Send selection to AI
          close = "<leader>cc"; # Close chat
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
                   adapter = "copilot",
                 },
                 inline = {
                   adapter = "copilot",
                 },
                 cmd = {
                   adapter = "copilot",
                 }
               },
               tools = {
                 diff = {
                   enabled = true,
                 },
               },
             })

             local progress = require("fidget.progress")
        local handles = {}
        local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

        vim.api.nvim_create_autocmd("User", {
        	pattern = "CodeCompanionRequestStarted",
        	group = group,
        	callback = function(e)
        		handles[e.data.id] = progress.handle.create({
        			title = "CodeCompanion",
        			message = "Thinking...",
        			lsp_client = { name = e.data.adapter.formatted_name },
        		})
        	end,
        })

        vim.api.nvim_create_autocmd("User", {
        	pattern = "CodeCompanionRequestFinished",
        	group = group,
        	callback = function(e)
        		local h = handles[e.data.id]
        		if h then
        			h.message = e.data.status == "success" and "Done" or "Failed"
        			h:finish()
        			handles[e.data.id] = nil
        		end
        	end,
        })
      '';
    };
  };
}
