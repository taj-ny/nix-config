{ pkgs, ... }:

{
  imports = [
    ./beets.nix

    ./../common/global

    ./../common/optional/desktop/kde

    ./../common/optional/programs/easyeffects

    ./../common/optional/programs/programming/sdks/dotnet.nix
    ./../common/optional/programs/programming/sdks/php.nix
    ./../common/optional/programs/programming/sdks/python.nix

    ./../common/optional/programs/terminal/konsole
    ./../common/optional/programs/terminal/zsh
  ];

  home = {
    stateVersion = "23.05";
    
    packages = with pkgs; [
      jetbrains.clion
    ];
  };

  custom.programs = {
    clion.enable = true;
    deemix.enable = true;
    nicotine-plus.enable = true;
    prismlauncher.enable = true;
    rider.enable = true;
  };
}
