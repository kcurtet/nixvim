{
  plugins = {
    obsidian = {
      enable = true;
      settings = {
        disable_frontmatter = false;

        workspaces = [
          {
            name = "Personal";
            path = "~/vault/personal";
          }
        ];

        notes_subdir = "notes";
        new_notes_location = "notes_subdir";

        templates = {
          folder = "templates";
        };
      };
    };
  };
}
