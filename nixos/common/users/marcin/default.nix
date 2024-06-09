{ pkgs, ... }:

{
  users.users.marcin = {
    isNormalUser = true;
    hashedPasswordFile = "/nix/persist/passwords/marcin";
    extraGroups = [ "wheel" "adbusers" ];
    shell = pkgs.zsh;

    openssh.authorizedKeys.keys = [
      ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIrMW7NUE7i3/6AksQmq34RK1xL2krFA0ljv8AiPho9Z marcin@andromeda''
    ];
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "marcin";
  };
}
