{
  plugins = {
    # Automatic session management
    auto-session = {
      enable = true;
      settings = {
        # Auto-save on exit
        auto_save = true;
        # Auto-restore on startup
        auto_restore = true;
        # Suppress directories from auto-save/restore
        suppressed_dirs = [
          "~/"
          "~/Projects"
          "~/Downloads"
          "~/Documents"
          "~/Desktop"
        ];
        # Suppress specific file types from session
        suppressed_filetypes = [
          "gitcommit"
          "gitrebase"
        ];
        # Log level
        log_level = "info";
      };
    };
  };
}
