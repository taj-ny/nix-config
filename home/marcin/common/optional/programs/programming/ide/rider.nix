{ outputs, lib, pkgs, ... }:

let
  patchDesktop = outputs.nixosModules.patchDesktop { inherit lib pkgs; };
in
{
  home.packages = with pkgs; [ 
    jetbrains.rider 
    (patchDesktop jetbrains.rider "rider" "^Exec=rider" "Exec=steam-run rider")
  ];
}
