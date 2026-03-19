# Compatibility wrapper for non-flake users
# Usage: nix-shell
(import (fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz") {
  src = ./.;
}).shellNix
