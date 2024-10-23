{
  pkgs ? (import ./nixpkgs.nix) { },
  lib ? pkgs.lib
}:

{
  default = pkgs.mkShell {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [ nix home-manager git ];
  };

  sffs = pkgs.mkShell {
    # nativeBuildInputs = with pkgs; [ fuse3 ];
    # buildInputs = [ pkgs.fuse3 ];
    packages = [ pkgs.dotnet-sdk_8 pkgs.hashcat pkgs.openssl pkgs.pkg-config pkgs.python312Packages.asn1crypto pkgs.john ];


    LD_LIBRARY_PATH = lib.makeLibraryPath [ pkgs.fuse3 pkgs.xorg.libX11 pkgs.xorg.libXrandr pkgs.fontconfig pkgs.libGL pkgs.openssl pkgs.python312Packages.asn1crypto pkgs.john ];
    shellHook = ''
      export CUDA_PATH=${pkgs.cudatoolkit}
    '';
  };
}
