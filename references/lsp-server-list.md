# LSP Server List

All 203 packaged LSP servers available as `lsp.servers.<name>.enable = true`.  
Source: `modules/lsp/servers/packages.nix` in the nixvim repository.

Each server's package is automatically pulled from nixpkgs. Set `package = null` if you want to use the server from your `$PATH` instead.

---

## Usage

```nix
lsp.servers = {
  nil_ls.enable = true;
  lua_ls = {
    enable = true;
    config.settings = { Lua.diagnostics.globals = [ "vim" ]; };
  };
};
```

---

## Full list (alphabetical)

```
aiken               air                 angularls
arduino_language_server  asm_lsp        ast_grep
astro               atlas               atopile
autotools_ls        ballerina           basedpyright
bashls              beancount           biome
bitbake_language_server  blueprint_ls   buck2
buf_ls              ccls                clangd
clojure_lsp         cmake               codebook
copilot             crystalline         csharp_ls
cssls               cue                 dafny
dagger              dartls              denols
dhall_lsp_server    diagnosticls        digestif
docker_compose_language_service         docker_language_server
dockerls            dolmenls            dotls
dprint              earthlyls           efm
elmls               elixirls            elp
emmet_language_server  emmet_ls         emmylua_ls
erg_language_server eslint              fennel_ls
fish_lsp            flow                fortls
fsautocomplete      fstar               futhark_lsp
ghcide              gitlab_ci_ls        gleam
glsl_analyzer       glslls              golangci_lint_ls
gopls               graphql             harper_ls
helm_ls             hls                 html
htmx                hyprls              idris2_lsp
java_language_server  jdtls             jedi_language_server
jqls                jsonls              jsonnet_ls
just                koka                kotlin_language_server
lean3ls             lemminx             lexical
lsp_ai              ltex                lua_ls
luau_lsp            markdown_oxide      marksman
matlab_ls           mesonlsp            metals
mint                mlir_lsp_server     mlir_pdll_lsp_server
muon                neocmake            nextls
nginx_language_server  nickel_ls        nil_ls
nim_langserver      nimls               nixd
nushell             ocamllsp            ols
omnisharp           openscad_lsp        oxfmt
oxlint              perlnavigator       perlpls
pest_ls             phan                phpactor
postgres_lsp        protols             psalm
pylsp               pylyzer             pyrefly
pyright             qmlls               quick_lint_js
regal               regols              rescriptls
rls                 roslyn_ls           rubocop
ruby_lsp            ruff                rumdl
rune_languageserver rust_analyzer       scheme_langserver
serve_d             shopify_theme_ls    slint_lsp
solargraph          solc                sourcekit
spectral            sqls                sqruff
standardrb          starlark_rust       starpls
statix              stylelint_lsp       stylua
superhtml           svelte              svls
swift_mesonls       syntax_tree         systemd_ls
systemd_lsp         tailwindcss         taplo
tblgen_lsp_server   tclsp               teal_ls
templ               terraform_lsp       terraformls
texlab              tflint              thriftls
tilt_ls             tinymist            tofu_ls
tombi               ts_ls               ts_query_ls
tsgo                ttags               ty
typeprof            typos_lsp           uiua
vacuum              vala_ls             vale_ls
vectorcode_server   verible             veryl_ls
vhdl_ls             vimls               vls
volar               vsrocq              vtsls
vue_ls              wgsl_analyzer       yamlls
zk                  zls                 zuban
```

---

## By language

| Language | Server(s) |
|----------|-----------|
| Nix | `nil_ls`, `nixd` |
| Lua | `lua_ls`, `emmylua_ls` |
| Rust | `rust_analyzer`, `rls` |
| TypeScript/JS | `ts_ls`, `vtsls`, `tsgo`, `denols`, `eslint`, `biome`, `quick_lint_js` |
| Python | `pyright`, `basedpyright`, `pylsp`, `jedi_language_server`, `pylyzer`, `pyrefly`, `ruff` |
| Go | `gopls`, `golangci_lint_ls` |
| C/C++ | `clangd`, `ccls` |
| C# | `omnisharp`, `roslyn_ls`, `csharp_ls` |
| Java | `jdtls`, `java_language_server` |
| Kotlin | `kotlin_language_server` |
| Scala | `metals` |
| Haskell | `hls`, `ghcide` |
| OCaml | `ocamllsp` |
| Zig | `zls` |
| Gleam | `gleam` |
| Elixir | `elixirls`, `lexical`, `nextls` |
| Erlang | `elp` |
| Ruby | `solargraph`, `ruby_lsp`, `rubocop`, `standardrb`, `syntax_tree` |
| PHP | `phpactor`, `psalm`, `phan` |
| Perl | `perlnavigator`, `perlpls` |
| Bash | `bashls` |
| Fish | `fish_lsp` |
| Nushell | `nushell` |
| HTML | `html`, `superhtml`, `htmx` |
| CSS | `cssls`, `stylelint_lsp` |
| Tailwind | `tailwindcss` |
| JSON | `jsonls` |
| YAML | `yamlls` |
| TOML | `taplo`, `tombi` |
| Markdown | `marksman`, `markdown_oxide`, `vale_ls`, `harper_ls` |
| LaTeX | `texlab` |
| Typst | `tinymist` |
| Terraform | `terraform_lsp`, `terraformls`, `tflint`, `tofu_ls` |
| Docker | `dockerls`, `docker_compose_language_service`, `docker_language_server` |
| Helm | `helm_ls` |
| SQL | `sqls`, `sqruff`, `postgres_lsp` |
| GraphQL | `graphql` |
| Protobuf | `protols` |
| Svelte | `svelte` |
| Vue | `volar`, `vue_ls` |
| Angular | `angularls` |
| Astro | `astro` |
| Templ | `templ` |
| Dart/Flutter | `dartls` |
| Swift | `sourcekit` |
| Zig | `zls` |
| Nim | `nimls`, `nim_langserver` |
| Julia | — (no dedicated entry, use LSP.jl manually) |
| Clojure | `clojure_lsp` |
| Common Lisp | — |
| Fennel | `fennel_ls` |
| Scheme | `scheme_langserver` |
| Racket | — |
| Idris2 | `idris2_lsp` |
| Lean | `lean3ls` |
| Agda | — (unpackaged) |
| Coq | — (unpackaged) |
| GLSL | `glsl_analyzer`, `glslls` |
| HLSL | — |
| WGSL | `wgsl_analyzer` |
| CMake | `cmake`, `neocmake` |
| Meson | `mesonlsp` |
| Makefile | `autotools_ls` |
| XML | `lemminx` |
| THRIFT | `thriftls` |
| VHDL | `vhdl_ls` |
| SystemD | `systemd_ls`, `systemd_lsp` |
| Nginx | `nginx_language_server` |
| Shopify Liquid | `shopify_theme_ls` |
| Teal | `teal_ls` |
| Starlark | `starlark_rust` |
| Rune | `rune_languageserver` |
| Koka | `koka` |
| Aiken | `aiken` |
| Air | `air` |
| Erg | `erg_language_server` |
| Futhark | `futhark_lsp` |
| Ballerina | `ballerina` |
| Dhall | `dhall_lsp_server` |
| Nickel | `nickel_ls` |
| CUE | `cue` |
| Dafny | `dagger`, `dafny` |
| Pest | `pest_ls` |
| Uiua | `uiua` |
| Vala | `vala_ls` |
| Verible | `verible` |
| Veryl | `veryl_ls` |
| Fortran | `fortls` |
| MATLAB | `matlab_ls` |
| F# | `fsautocomplete` |
| F* | `fstar` |
| Emmet | `emmet_language_server`, `emmet_ls` |
| OpenSCAD | `openscad_lsp` |
| Diagnostic LS | `diagnosticls` |
| EFM | `efm` |
| Hyprland | `hyprls` |
| Arduino | `arduino_language_server` |
| Assembly | `asm_lsp` |
| Beancount | `beancount` |
| Bitbake | `bitbake_language_server` |
| Blueprint | `blueprint_ls` |
| Buck2 | `buck2` |
| Buf/Protobuf | `buf_ls` |
| Crystalline | `crystalline` |
| Dolmen | `dolmenls` |
| Dprint | `dprint` |
| Earthly | `earthlyls` |
| Digestif | `digestif` |
| GitLab CI | `gitlab_ci_ls` |
| Just | `just` |
| JQ | `jqls` |
| JSONnet | `jsonnet_ls` |
| Mintlify | `mint` |
| MLIR | `mlir_lsp_server`, `mlir_pdll_lsp_server` |
| Muon | `muon` |
| oxlint | `oxlint` |
| Regal | `regal` |
| ReScript | `rescriptls` |
| Rumdl | `rumdl` |
| Slint | `slint_lsp` |
| Solidity | `solc` |
| Spectral | `spectral` |
| StarPLS | `starpls` |
| Statix | `statix` |
| Stylua | `stylua` |
| TCL | `tclsp` |
| Tblgen | `tblgen_lsp_server` |
| Tflint | `tflint` |
| Tilt | `tilt_ls` |
| TTags | `ttags` |
| Ty | `ty` |
| Typeprof | `typeprof` |
| Typos | `typos_lsp` |
| Vacuum | `vacuum` |
| VectorCode | `vectorcode_server` |
| VimL | `vimls` |
| VLS | `vls` |
| Vsrocq | `vsrocq` |
| wgsl | `wgsl_analyzer` |
| zk notes | `zk` |
| Zuban | `zuban` |
| AST Grep | `ast_grep` |
| Atlas | `atlas` |
| Atopile | `atopile` |
| CodeBook | `codebook` |
| Copilot | `copilot` |
| Flow | `flow` |
| Harper | `harper_ls` |
| LSP AI | `lsp_ai` |
| LTeX | `ltex` |
| Luau | `luau_lsp` |
| OLS | `ols` |
| Regols | `regols` |
| Solargraph | `solargraph` |
