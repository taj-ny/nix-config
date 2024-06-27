{ pkgs, ... }:

{
  home.packages = with pkgs; [ keepassxc ];

  modules.impermanence.persistentDirectories = [ 
    ".config/keepassxc"
    "keepass"
  ];
}
