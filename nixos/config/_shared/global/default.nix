{
  lib,
  pkgs,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;

  environment = {
    stub-ld.enable = lib.mkForce false;
    systemPackages = builtins.attrValues {
      inherit (pkgs)
        htop
        nix-output-monitor
        vim;
    };
    variables.EDITOR = "vim";
  };
  security.sudo.enable = true;
  services = {
    journald.extraConfig = "MaxRetentionSec=1d";
    mysql.package = pkgs.mariadb;
    openssh = {
      enable = true;
      settings = {
        KbdInteractiveAuthentication = false;
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
  users.users.root.hashedPassword = "!";
}
