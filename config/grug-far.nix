{
  # grug-far.nvim - Live grep with replace
  plugins.grug-far = {
    enable = true;
    settings = {
      icons = {
        enabled = true;
      };
      keymaps = {
        replace = "<leader>rf";
        qflist = "<leader>rq";
        sync = "<leader>rs";
        help = "?";
      };
      options = {
        debounceMs = 100;
        searchPosition = "start";
        searchDirection = "incremental";
        keymaps = {
          qflist = {
            description = "Send results to quickfix list";
            keymap = "<leader>q";
          };
          replace = {
            description = "Perform replace action";
            keymap = "<leader>R";
          };
          historyAdd = {
            description = "Add search string to history";
            keymap = "<C-s>";
          };
          historyOpen = {
            description = "Open search history";
            keymap = "<M-s>";
          };
        };
      };
    };
  };
}
