{
  plugins = {
    obsidian = {
      enable = true;
      settings = {
        disable_frontmatter = false;

        workspaces = [
          {
            name = "Vault";
            path = "~/vault/";
          }
        ];

        new_notes_location = "00-inbox";

        templates = {
          folder = "40-resources/templates";
        };
      };
    };
  };
}
