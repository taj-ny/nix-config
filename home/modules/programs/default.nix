{
  lib,
  pkgs,
  ...
}:

let
  mkProgramOption = {
    name,
    optionName ? lib.replaceStrings [ " " ] [ "-" ] (lib.toLower name),
    package,
    persistentDirectories ? [ ],
    persistentFiles ? [ ]
  }:
  {
    options.programs.${optionName}.enable = lib.mkEnableOption name;
    config = {
      custom.impermanence = {
        inherit persistentDirectories persistentFiles;
      };
      home.packages = [ package ];
    };
  };
in
{
  imports = lib.allExceptThisDefault ./.;
} // (lib.mkMergeRecursive [
  (mkProgramOption {
    name = "Clementine";
    package = pkgs.clementine;
    persistentDirectories = [
      ".cache/Clementine"
      ".config/Clementine"
    ];
  })
  (mkProgramOption {
    name = "deemix";
    package = pkgs.python311Packages.deemix;
    persistentFiles = [ ".config/deemix/.arl" ];
  })
  (mkProgramOption {
    name = "KeepassXC";
    package = pkgs.keepassxc;
    persistentDirectories = [
      ".cache/keepassxc"
      ".config/keepassxc"
    ];
  })
  (mkProgramOption {
    name = "Nicotine+";
    optionName = "nicotine-plus";
    package = pkgs.nicotine-plus;
      persistentDirectories = [
      ".config/nicotine"
      ".local/share/nicotine"
    ];
  })
  (mkProgramOption {
    name = "Prism Launcher";
    package = pkgs.prismlauncher;
    persistentDirectories = [ ".local/share/PrismLauncher" ];
  })
  (mkProgramOption {
    name = "Rclone";
    package = pkgs.rclone;
    persistentDirectories = [ ".config/rclone" ];
  })
  (mkProgramOption {
    name = "Yakuake";
    package = pkgs.kdePackages.yakuake;
  })
])
