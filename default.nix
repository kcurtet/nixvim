# Compatibility wrapper for nix-build
# Usage: nix-build
(import (fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz") {
  src = ./.;
}).defaultNix
