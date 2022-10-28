#!/usr/bin/env bats

setup(){
  export OLD_DRV="$(nix-instantiate ./old-derivation/drv.nix)"
  export NEW_DRV="$(nix-instantiate ./new-derivation/drv.nix)"
}

@test "human readable" {
  helpers/run-diff.sh ./expected-outputs/human-readable --environment
}

@test "json" {
  helpers/run-diff.sh ./expected-outputs/json --environment --json
}
