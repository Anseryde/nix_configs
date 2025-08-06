{ pkgs ? import <nixpkgs> {}
, pkgsUnfree ? import <nixpkgs> { config = { allowUnfree = true; }; }
}: {
  ladybird = import ./ladybird.nix { inherit pkgs; };
}
