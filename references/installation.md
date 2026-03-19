# Installation

Nixvim supports four deployment targets. All use the same configuration options; only the wrapper differs.

---

## NixOS Module

Add nixvim as a NixOS module. Configuration lives under `programs.nixvim`.

**flake.nix:**
```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixvim, ... }: {
    nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
      modules = [
        nixvim.nixosModules.nixvim
        ./configuration.nix
      ];
    };
  };
}
```

**configuration.nix (or any NixOS module):**
```nix
{ ... }:
{
  programs.nixvim = {
    enable = true;

    opts.number = true;
    plugins.telescope.enable = true;
    # ... all other options
  };
}
```

---

## Home Manager Module

Add nixvim as a Home Manager module. Configuration lives under `programs.nixvim`.

**flake.nix:**
```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }: {
    homeConfigurations.myuser = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        nixvim.homeModules.nixvim
        ./home.nix
      ];
    };
  };
}
```

**home.nix:**
```nix
{ ... }:
{
  programs.nixvim = {
    enable = true;

    opts.number = true;
    # ... all other options
  };
}
```

> **Note:** `homeManagerModules` is deprecated; use `homeModules` instead.

---

## Standalone (makeNixvim / makeNixvimWithModule)

Build a standalone Neovim derivation — no NixOS or Home Manager required.

**flake.nix:**
```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;

      # Simple form
      myNeovim = nixvim.legacyPackages.${system}.makeNixvim {
        opts.number = true;
        plugins.telescope.enable = true;
        # ... all options
      };

      # Module form (allows imports, _module.args, etc.)
      myNeovim2 = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        module = { pkgs, ... }: {
          opts.number = true;
          plugins.telescope.enable = true;
        };
        # extraSpecialArgs = { ... };  # optional extra module args
      };
    in
    {
      packages.${system} = {
        default = myNeovim;
        nvim = myNeovim;
      };

      # Run directly
      apps.${system}.default = {
        type = "app";
        program = "${myNeovim}/bin/nvim";
      };
    };
}
```

**Standalone derivation methods:**
- `myNeovim.extend { ... }` — create a new derivation with additional options merged
- `myNeovim.options` — access declared options (useful for nixd LSP)
- `myNeovim.config` — access evaluated config

---

## nix-darwin Module

Same as NixOS but for macOS with nix-darwin.

**flake.nix:**
```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { darwin, nixvim, ... }: {
    darwinConfigurations.mymac = darwin.lib.darwinSystem {
      modules = [
        nixvim.nixDarwinModules.nixvim
        ./darwin-configuration.nix
      ];
    };
  };
}
```

**darwin-configuration.nix:**
```nix
{
  programs.nixvim = {
    enable = true;
    # ... options
  };
}
```

---

## Flake template

Nixvim provides a starter template:

```bash
nix flake init --template github:nix-community/nixvim
```

---

## Using with an existing nixvim config flake (like this repo)

If your flake already imports nixvim (like this repository), you can reference it directly:

```nix
# In a NixOS module that imports nixvim's module
{
  programs.nixvim = import ./config { inherit pkgs; };
}
```

Or use `makeNixvimWithModule` with your module files:

```nix
nixvim.legacyPackages.${system}.makeNixvimWithModule {
  module = import ./config;
}
```

---

## nixd integration (Nix LSP completion for your config)

To get completion for `programs.nixvim` options in nixd:

```json
{
  "nixd": {
    "options": {
      "nixvim": {
        "expr": "(builtins.getFlake \"path:/path/to/your/nixvim-flake\").packages.x86_64-linux.default.options"
      }
    }
  }
}
```
