{
  # gen.nvim - Lightweight inline AI completions
  plugins.gen = {
    enable = false;
    settings = {
      model = "ollama";
      display_mode = "inline";
      show_model = true;
      show_prompt = false;
      no_auto_close = false;
      init = false;
      command_prompt = " ";
      disable_builtin_commands = false;
      disable_builtin_options = false;
      body_maker.__raw = ''
        function(prompt, opts)
          return {
            model = opts.model or "mistral",
            system = "You are an AI programming assistant.",
            stream = true,
            prompt = prompt,
          }
        end
      '';
    };
  };
}
