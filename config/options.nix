{
  globals = {
    mapleader = " ";
    maplocalleader = ",";
  };

  opts = {
    # Indentation
    shiftwidth = 2;
    tabstop = 2;
    softtabstop = 2;
    expandtab = true;
    smartindent = true;
    autoindent = true;

    # Line numbers
    number = true;
    relativenumber = true;

    # Search
    ignorecase = true;
    smartcase = true;
    hlsearch = true;
    incsearch = true;

    # UI
    termguicolors = true;
    cursorline = true;
    signcolumn = "yes";
    scrolloff = 8;
    sidescrolloff = 8;
    wrap = false;
    showmode = false;
    pumheight = 10;
    splitbelow = true;
    splitright = true;
    cmdheight = 1;

    # Behavior
    mouse = "a";
    clipboard = "unnamedplus";
    undofile = true;
    swapfile = false;
    backup = false;
    updatetime = 250;
    timeoutlen = 300;
    completeopt = "menu,menuone,noselect";
    autoread = true;

    # Folding (treesitter-based)
    shada = "'100,<50,s10,h";
    foldmethod = "expr";
    foldexpr = "v:lua.vim.treesitter.foldexpr()";
    foldcolumn = "0";
    foldtext = "";
    foldlevel = 99;
    foldlevelstart = 99;
    foldnestmax = 4;

    # File encoding
    fileencoding = "utf-8";
  };
}
