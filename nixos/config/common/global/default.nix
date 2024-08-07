{
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./programs
    ./boot.nix
    ./impermanence.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./user.nix
  ];

  custom = {
    impermanence.enable = true;

    hardware.external.yubikey.enable = true;
  };

  environment = {
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      htop
      fontconfig
      nix-output-monitor
      powertop
      steam-run
      vim
    ];

    stub-ld.enable = lib.mkForce false;
  };

  programs = {
    dconf.enable = true;
    firejail.enable = true;
    fuse.userAllowOther = true;
    git.enable = true;
    ssh.startAgent = true;
    zsh.enable = true;
  };

  services = {
    openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
      };
    };

    fwupd.enable = true;
    mysql.package = pkgs.mariadb;
    preload.enable = true;
    ratbagd.enable = true;
  };

  users.users.root.hashedPassword = "!";

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

  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults		timestamp_timeout=1
    '';
  };

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=3s
  '';
}
