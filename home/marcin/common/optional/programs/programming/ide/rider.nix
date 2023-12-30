{ pkgs, ... }:

{
  home.packages = with pkgs; [ 
    jetbrains.rider 
    (patchDesktop jetbrains.rider "rider" "^Exec=rider" "Exec=steam-run rider")
  ];
}
