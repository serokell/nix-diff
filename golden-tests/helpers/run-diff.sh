#!/usr/bin/env bash

expected="$1"
shift

nix-diff "$OLD_DRV" "$NEW_DRV" "$@" > /tmp/nix-diff-output
diff "$expected" /tmp/nix-diff-output
code="$?"
rm /tmp/nix-diff-output
exit "$code"
