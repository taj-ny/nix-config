{
  lib,
  pkgs,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

  custom.hardware.external.yubikey.enable = true;
  environment = {
    pathsToLink = [ "/share/zsh" ];
    systemPackages = builtins.attrValues {
      inherit (pkgs)
        fontconfig
        powertop
        steam-run;
    };
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
  networking.extraHosts = ''
    192.168.1.100 andromeda
    192.168.1.101 thinkpad
  '';
  nix.settings.trusted-public-keys = [
    "andromeda:RKWnCuVLtIChwcxy6ti8u8SH+9ye2peaSlrTjVRQiCk="
    "thinkpad:84A19lzQ57U6+bRnNzjqiTTm4stGeIZ/cCJV8DtveXk="
  ];
  programs = {
    dconf.enable = true;
    firejail.enable = true;
    fuse.userAllowOther = true;
    git.enable = true;
    zsh.enable = true;
  };
  security.rtkit.enable = true;
  services = {
    fwupd.enable = true;
    nix-serve = {
      enable = true;
      secretKeyFile = "/nix/nix-serve/private-key";
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    ratbagd.enable = true;
    tor = {
      enable = true;
      client.enable = true;
    };
  };
  systemd.services."user@".serviceConfig.TimeoutStopSec = "2s"; # Workaround for slow shutdown
}