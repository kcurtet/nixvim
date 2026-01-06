{
  # DAP (Debugger)
  plugins = {
    dap.enable = true;
    dap-ui = {
      enable = true;
      lazyLoad.settings = {
        event = "VeryLazy";
      };
    };
  };
}
