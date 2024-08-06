{
  pkgs ? (import ./nixpkgs.nix) { },
  lib ? pkgs.lib
}:

{
  default = pkgs.mkShell {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [ nix home-manager git ];
  };
}
