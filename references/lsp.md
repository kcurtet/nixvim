# LSP Configuration

Nixvim uses Neovim's built-in `vim.lsp` API (not lspconfig). Servers are declared under `lsp.servers.<name>`.

---

## Basic setup

```nix
plugins.lsp = {
  enable = true;

  servers = {
    nil_ls.enable = true;      # Nix
    lua_ls.enable = true;      # Lua
    rust_analyzer.enable = true;
    ts_ls.enable = true;       # TypeScript/JavaScript
    pyright.enable = true;     # Python
    gopls.enable = true;       # Go
    clangd.enable = true;      # C/C++
  };
};
```

> **Note:** `plugins.lsp` is the new top-level LSP module. The older `plugins.lspconfig` also exists but wraps this.

---

## Server options

Each server under `lsp.servers.<name>` has:

```nix
lsp.servers.lua_ls = {
  enable = true;

  # Name used in vim.lsp.enable() — defaults to the attribute name
  name = "lua_ls";

  # Whether to call vim.lsp.enable() — default: true
  activate = true;

  # Package to use — defaults to nixpkgs package for the server
  package = pkgs.lua-language-server;

  # When true, the package is appended to PATH instead of prepended
  # (lets local devshell versions take priority)
  packageFallback = false;

  # Config passed to vim.lsp (root_markers, cmd, filetypes, settings, etc.)
  config = {
    settings = {
      Lua = {
        runtime.version = "LuaJIT";
        diagnostics.globals = [ "vim" ];
        workspace.checkThirdParty = false;
        telemetry.enable = false;
      };
    };
  };
};
```

---

## Global server config (`lsp.servers."*"`)

Apply config to ALL servers:

```nix
lsp.servers."*" = {
  config = {
    # These settings apply to all servers
    capabilities.__raw = ''
      vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )
    '';
  };
};
```

---

## LSP keymaps

Keymaps registered when any LSP server attaches to a buffer.

```nix
lsp.keymaps = [
  # Using lspBufAction (shorthand for vim.lsp.buf.<action>)
  { key = "gd";  lspBufAction = "definition"; }
  { key = "gD";  lspBufAction = "references"; }
  { key = "gt";  lspBufAction = "type_definition"; }
  { key = "gi";  lspBufAction = "implementation"; }
  { key = "K";   lspBufAction = "hover"; }
  { key = "<leader>ca"; lspBufAction = "code_action"; }
  { key = "<leader>rn"; lspBufAction = "rename"; }
  { key = "<leader>f";  lspBufAction = "format"; }

  # Using raw action
  {
    key = "<leader>k";
    action.__raw = "function() vim.diagnostic.jump({ count=-1, float=true }) end";
    options.desc = "Previous diagnostic";
  }
  {
    key = "<leader>j";
    action.__raw = "function() vim.diagnostic.jump({ count=1, float=true }) end";
    options.desc = "Next diagnostic";
  }

  # Using telescope for definitions
  {
    key = "gd";
    action.__raw = "require('telescope.builtin').lsp_definitions";
    options.desc = "Go to definition (Telescope)";
  }
];
```

`lspBufAction` is a nixvim shorthand. It sets `action` to `vim.lsp.buf[<action>]`.

Keymaps are attached on `LspAttach` with `buffer = args.buf`, so they are buffer-local.

---

## `lsp.onAttach`

Lua code (function body, not a function) run when any LSP attaches. Variables `client` and `bufnr` are in scope.

```nix
lsp.onAttach = ''
  -- client: the LSP client object
  -- bufnr: the buffer number
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
'';
```

---

## Inlay hints

```nix
lsp.inlayHints.enable = true;
# Calls vim.lsp.inlay_hint.enable(true)
```

---

## Extra raw Lua for LSP

```nix
lsp.luaConfig.content = ''
  -- custom Lua injected into the LSP block
  vim.lsp.set_log_level("debug")
'';
```

---

## Packaged LSP servers

203 servers are packaged in nixpkgs and available as `lsp.servers.<name>`. See `lsp-server-list.md` for the full list.

Common ones:

| Name | Language |
|------|----------|
| `nil_ls` | Nix |
| `nixd` | Nix (alternative) |
| `lua_ls` | Lua |
| `rust_analyzer` | Rust |
| `ts_ls` | TypeScript/JavaScript |
| `vtsls` | TypeScript/JavaScript (alternative) |
| `pyright` | Python |
| `basedpyright` | Python (alternative) |
| `pylsp` | Python (alternative) |
| `gopls` | Go |
| `clangd` | C/C++ |
| `ccls` | C/C++ (alternative) |
| `omnisharp` | C# |
| `jdtls` | Java |
| `kotlin_language_server` | Kotlin |
| `metals` | Scala |
| `hls` | Haskell |
| `ocamllsp` | OCaml |
| `zls` | Zig |
| `gleam` | Gleam |
| `erlangls` | Erlang |
| `elixirls` | Elixir |
| `solargraph` | Ruby |
| `ruby_lsp` | Ruby (alternative) |
| `html` | HTML |
| `cssls` | CSS |
| `jsonls` | JSON |
| `yamlls` | YAML |
| `taplo` | TOML |
| `bashls` | Bash |
| `marksman` | Markdown |
| `texlab` | LaTeX |
| `tinymist` | Typst |
| `dockerls` | Dockerfile |
| `terraform_lsp` / `terraformls` | Terraform |
| `helm_ls` | Helm |
| `sqls` | SQL |
| `tailwindcss` | Tailwind CSS |
| `svelte` | Svelte |
| `volar` | Vue |
| `angularls` | Angular |

---

## Integration with cmp (completion)

To get LSP completions in nvim-cmp:

```nix
# Add nvim_lsp source to cmp
plugins.cmp.settings.sources = [
  { name = "nvim_lsp"; }
  # ... other sources
];

# Pass LSP capabilities from cmp to ALL servers
lsp.servers."*".config = {
  capabilities.__raw = ''
    require("cmp_nvim_lsp").default_capabilities()
  '';
};
```

Or for blink-cmp:
```nix
plugins.blink-cmp.settings.sources.default = [ "lsp" "path" "snippets" "buffer" ];
# blink-cmp automatically wires capabilities
```

---

## Custom/unpackaged servers

For servers not in nixpkgs, use a freeform server name and set `package = null`:

```nix
lsp.servers.my_custom_server = {
  enable = true;
  package = null;   # must be on PATH manually
  config = {
    cmd = [ "my-language-server" "--stdio" ];
    filetypes = [ "myfiletype" ];
    root_markers = [ "myconfig.json" ];
  };
};
```

---

## Per-server `on_attach`

Use `config.on_attach` for per-server callbacks (as a raw Lua function):

```nix
lsp.servers.rust_analyzer.config = {
  on_attach.__raw = ''
    function(client, bufnr)
      -- rust-specific on_attach
    end
  '';
  settings = {
    "rust-analyzer" = {
      checkOnSave.command = "clippy";
    };
  };
};
```

---

## Language server plugins (plugin wrappers)

Some LSP servers have dedicated nixvim plugin modules with richer configuration:

```nix
plugins.rustaceanvim.enable = true;     # rust-analyzer with extra features
plugins.jdtls.enable = true;            # Java JDTLS
plugins.haskell-tools.enable = true;    # Haskell tools
plugins.flutter-tools.enable = true;    # Flutter
plugins.clangd-extensions.enable = true; # clangd extras
plugins.typescript-tools.enable = true;  # tsserver alternative
plugins.roslyn.enable = true;           # C# Roslyn
plugins.rzls.enable = true;             # Razor/Blazor
plugins.luau-lsp.enable = true;         # Luau
```
