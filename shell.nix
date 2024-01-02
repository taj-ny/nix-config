{
  pkgs ? (import ./nixpkgs.nix) { },
  lib ? pkgs.lib
}:

{
  default = pkgs.mkShell {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [ nix home-manager git ];
  };

  gcc = pkgs.mkShell rec {
    buildInputs = with pkgs; [
      gcc
    ];
  };
}
