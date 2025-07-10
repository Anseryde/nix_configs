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
      pkgs.clangStdenv.mkDerivation
      {
        name = "armorpaint-build-shell";
        nativeBuildInputs = [ pkgs.pkg-config ];
        buildInputs = with pkgs; [
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
          gtk3.dev
          gtk3-x11
          (runCommand "cDependencies" {} ''
            mkdir -p $out/include
            cp -r ${gtk3.dev}/include/gtk-3.0/* $out/include
          '')
          udev
          libxkbcommon
          xorg.libXext
          pkg-config
          zlib
        ];
        shellHook = ''
          NIX_CFLAGS_COMPILE="$(pkg-config --cflags gtk3) $NIX_CFLAGS_COMPILE"
          fish
        '';
      };
  };
}
