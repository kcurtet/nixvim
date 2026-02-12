{
  viAlias = true;
  vimAlias = true;
  enableMan = false;
  enablePrintInit = true; # nixvim-print-init tool
  nixpkgs.config.allowUnfree = true;

  clipboard.providers.wl-copy.enable = true;
  clipboard.providers.xclip.enable = false;
}
