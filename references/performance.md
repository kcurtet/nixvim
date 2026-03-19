# Performance Options

Nixvim provides two performance-related options for reducing startup time.

---

## Byte-compile Lua (`performance.byteCompileLua`)

Compiles Lua files to Neovim bytecode during the Nix build. Bytecode loads faster than source.

```nix
performance.byteCompileLua = {
  enable = true;        # master switch

  initLua = true;       # compile init.lua (default: true when enable = true)
  configs = true;       # compile lua configuration files (default: true)
  plugins = true;       # compile lua files in plugins (default: false)
  nvimRuntime = false;  # compile lua files in Nvim runtime (default: false)
  luaLib = false;       # compile lua library (default: false)

  # Plugins to exclude from byte compilation
  # (some plugins break when byte-compiled, e.g. those using loadstring)
  excludedPlugins = [
    "faster.nvim"
    # pkgs.vimPlugins.conform-nvim  # can also pass a package
  ];
};
```

**Recommended starting config:**
```nix
performance.byteCompileLua = {
  enable = true;
  plugins = true;
};
```

If a plugin breaks after enabling `plugins = true`, add it to `excludedPlugins`.

---

## Combine plugins (`performance.combinePlugins`)

**Experimental.** Merges all plugins into a single "plugin pack" directory. Reduces the number of directories on the `runtimepath`, which speeds up startup and file lookup.

```nix
performance.combinePlugins = {
  enable = true;

  # Additional paths to include when combining plugins
  # Default already includes: /autoload, /colors, /compiler, /doc, /ftplugin,
  # /indent, /keymap, /lang, /lsp, /lua, /pack, /parser, /plugin, /queries,
  # /rplugin, /spell, /syntax, /tutor, /after, /ftdetect, /data/plenary/filetypes
  pathsToLink = [
    "/data"        # example: if a plugin stores data outside standard dirs
  ];

  # Plugins that must NOT be combined (e.g., those with filename collisions)
  standalonePlugins = [
    "nvim-treesitter"
    # pkgs.vimPlugins.some-plugin  # can also pass a package
  ];
};
```

**Warning:** All plugins must have unique filenames and doc tags. Name collisions cause a build failure. Add colliding plugins to `standalonePlugins`.

---

## Lua loader

Enable Neovim's built-in Lua module caching (separate from byte-compile):

```nix
luaLoader.enable = true;
```

This enables `vim.loader.enable()` which caches Lua modules after first load.

---

## Full performance example

```nix
{
  luaLoader.enable = true;

  performance = {
    byteCompileLua = {
      enable = true;
      plugins = true;
      nvimRuntime = true;
    };

    combinePlugins = {
      enable = true;
      standalonePlugins = [ "nvim-treesitter" ];
    };
  };
}
```
