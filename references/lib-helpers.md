# lib.nixvim Helper Functions

These are available in nixvim module files as `lib.nixvim.*`. They solve common Nix→Lua conversion problems and provide utilities for building options.

---

## Raw Lua (`mkRaw`)

Wrap a string as raw Lua code. The output will be emitted verbatim in the Lua config file instead of being converted to a Lua string.

```nix
# Function form
action = lib.nixvim.mkRaw "vim.lsp.buf.hover";

# Attribute form (equivalent, works in any option)
action.__raw = "vim.lsp.buf.hover";

# In settings
plugins.telescope.settings = {
  defaults = {
    # A raw Lua function
    path_display.__raw = ''
      function(opts, path)
        return path
      end
    '';
  };
};
```

`mkRaw` returns `null` when given `null` or `""`, so it's safe to use conditionally.

---

## `listToUnkeyedAttrs`

Convert a Nix list to a Lua mixed table (array part + optional hash part). Enables patterns like `{ "a", "b", foo = "bar" }` in Lua.

```nix
# Produces Lua: {"a", "b", foo = "bar"}
lib.nixvim.listToUnkeyedAttrs ["a" "b"] // { foo = "bar"; }
```

Use when a plugin expects a Lua array with optional named keys at the same level.

---

## `toRawKeys` / `mkRawKey`

Convert attribute names to raw Lua keys (used with `[key]` Lua syntax instead of `key`).

```nix
# Produces Lua: {[vim.fn.expand("~/.config")] = true}
lib.nixvim.toRawKeys {
  ''vim.fn.expand("~/.config")'' = true;
}

# Single key
lib.nixvim.mkRawKey ''vim.fn.expand("~/.config")'' true;
```

---

## `emptyTable`

Produce an empty Lua table `{}` instead of `nil`. Useful when an option defaults to `null` but you want to pass `{}` to a plugin.

```nix
plugins.some-plugin.settings = {
  config = lib.nixvim.emptyTable;  # => {}  not nil
};

# Equivalent form:
config.__empty = null;
```

---

## `toLuaObject`

Convert a Nix value to a Lua literal string. Handles:
- strings → `"string"`
- numbers → `42`
- booleans → `true`/`false`
- null → `nil`
- lists → `{ "a", "b", "c" }`
- attr sets → `{ key = value }`
- `{ __raw = "..." }` → verbatim Lua
- `{ __unkeyed-N = ... }` → array elements in mixed tables
- `{ __rawKey__key = ... }` → raw key syntax `[key]`
- `{ __empty = null }` → `{}`

This is what nixvim uses internally to convert all `settings` options to Lua.

---

## `mkRenamedOptionModule` / `mkRemovedOptionModule`

Used internally for backwards compatibility. Not needed in user config.

---

## Option helpers

These are used when writing nixvim modules (e.g., plugin definitions), not in end-user configs.

### `mkNullOrOption type description`
Creates an option with type `nullOr type`, defaulting to `null`.

### `mkNullOrStr description`
`mkNullOrOption (maybeRaw str)` — accepts a string or `{ __raw = "..." }`.

### `mkNullOrLua description`
Option accepting raw Lua string.

### `defaultNullOpts`
Namespace with helpers that all default to `null`:

```nix
# In a plugin module:
settingsOptions = {
  timeout = lib.nixvim.defaultNullOpts.mkInt 500 "Timeout in ms.";
  enable_foo = lib.nixvim.defaultNullOpts.mkBool false "Enable foo.";
  name = lib.nixvim.defaultNullOpts.mkStr "default" "Name.";
  style = lib.nixvim.defaultNullOpts.mkEnum [ "a" "b" "c" ] "a" "Style.";
};
```

### `mkNullOrStrLuaOr type description`
Option accepting either a Lua string or `type`.

---

## Nix→Lua conversion rules (summary)

When you write `settings = { ... }`, the values are converted by `toLuaObject`:

| Nix value | Lua output |
|-----------|-----------|
| `"hello"` | `"hello"` |
| `42` | `42` |
| `3.14` | `3.14` |
| `true` | `true` |
| `false` | `false` |
| `null` | `nil` |
| `[ "a" "b" ]` | `{ "a", "b" }` |
| `{ foo = 1; }` | `{ foo = 1 }` |
| `{ __raw = "expr"; }` | `expr` (verbatim) |
| `{ __empty = null; }` | `{}` |
| `listToUnkeyedAttrs ["a"] // { x = 1; }` | `{ "a", x = 1 }` |
| `toRawKeys { "expr" = v; }` | `{ [expr] = v }` |

---

## `mkBinding` (keymaps)

Used to create keymap definitions programmatically. In user config, prefer the `keymaps` list directly.

---

## `nestedLiteralLua`

Escape Lua code for use as a defaultText value in option documentation. Only needed when writing module options, not in user configs.

---

## Practical examples

### Pass a Lua function as a setting

```nix
plugins.telescope.settings.defaults = {
  # Raw Lua function
  file_previewer.__raw = "require('telescope.previewers').vim_buffer_cat.new";

  # Inline anonymous function
  path_display.__raw = ''
    function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      return string.format("%s (%s)", tail, path)
    end
  '';
};
```

### Mixed Lua array + hash table

```nix
# Produces: require('plugin').setup({ "first", "second", option = true })
plugins.some-plugin.settings =
  lib.nixvim.listToUnkeyedAttrs [ "first" "second" ] // { option = true; };
```

### Dynamic key based on Lua expression

```nix
plugins.some-plugin.settings = lib.nixvim.toRawKeys {
  "vim.api.nvim_get_mode().mode" = "something";
};
# Produces: { [vim.api.nvim_get_mode().mode] = "something" }
```

### Conditional raw Lua

```nix
{
  key = "K";
  action = lib.nixvim.mkRaw (if useTelescope then
    "require('telescope.builtin').lsp_hover"
  else
    "vim.lsp.buf.hover"
  );
}
```
