{
  plugins = {
    obsidian = {
      enable = true;
      settings = {
        legacy_commands = false;

        workspaces = [
          {
            name = "Vault";
            path = "~/vault/";
          }
        ];

        notes_subdir = "00-inbox";

        daily_notes = {
          folder = "50-journal/daily";
          date_format = "%Y-%m-%d";
          alias_format = "%B %-d, %Y";
          default_tags = ["daily-notes"];
          template = "40-resources/templates/daily-note.md";
        };

        new_notes_location = "notes_subdir";

        templates = {
          folder = "40-resources/templates";
        };
      };
    };
  };
}
