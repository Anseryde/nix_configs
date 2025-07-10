{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {
    devShells."x86_64-linux".default =
      pkgs.mkShell
      pkgs.mkShell.override
      {
        stdenv = pkgs.clangStdenv;
      }
      {
        packages = with pkgs; [
          clang
          xorg.libXinerama
          xorg.libXrandr
          alsa-lib
          xorg.libXi
          mesa
          libGL
          xorg.libXcursor
          vulkan-tools
          gtk3
          gtk3-x11
          udev
          libxkbcommon
          xorg.libXext
        ];
        shellHook = ''
          fish
        '';
      };
  };
}
