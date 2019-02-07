#!/bin/sh

nix-shell -p 'idrisPackages.with-packages (with idrisPackages; [ contrib ])' gmp --run "elba build && target/bin/rolidris"
