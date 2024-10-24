{
  lib,
  pkgs,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

  custom = {
    hardware.external.yubikey.enable = true;
    impermanence.enable = true;
  };
  environment = {
    pathsToLink = [ "/share/zsh" ];
    stub-ld.enable = lib.mkForce false;
    systemPackages = builtins.attrValues {
      inherit (pkgs)
        htop
        fontconfig
        nix-output-monitor
        powertop
        steam-run
        vim;
    };
    variables.EDITOR = "vim";
  };
  fonts.packages = with pkgs; [
    corefonts
    noto-fonts
    noto-fonts-emoji
    liberation_ttf
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  programs = {
    dconf.enable = true;
    firejail.enable = true;
    fuse.userAllowOther = true;
    git.enable = true;
    zsh.enable = true;
  };
  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults		timestamp_timeout=1
    '';
  };
  services = {
    fwupd.enable = true;
    mysql.package = pkgs.mariadb;
    openssh = {
      enable = true;
      settings = {
        KbdInteractiveAuthentication = false;
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    preload.enable = true;
    ratbagd.enable = true;
  };
  systemd.services."user@".serviceConfig.TimeoutStopSec = "2s"; # TODO workaround
  users.users.root.hashedPassword = "!";
}
