{
  plugins = {
    # Better UI for inputs and selects
    dressing = {
      enable = true;
      settings = {
        input = {
          enabled = true;
          # Relative to cursor for better UX
          relative = "cursor";
          # Prefer width
          prefer_width = 40;
        };
        select = {
          enabled = true;
          relative = "cursor";
        };
      };
    };

    # Better register management and visualization
    # Note: registers-nvim has no dedicated Nixvim module; use extraPlugins
    # registers = {
    #   enable = true;
    #   settings = {
    #     window = {
    #       border = "rounded";
    #       max_width = 80;
    #       max_height = 20;
    #     };
    #   };
    # };
  };
}
