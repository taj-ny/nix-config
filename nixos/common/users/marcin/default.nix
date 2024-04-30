{ pkgs, ... }:

{
  users.users.marcin = {
    isNormalUser = true;
    hashedPasswordFile = "/persist/passwords/marcin";
    extraGroups = [ "wheel" "adbusers" ];
    shell = pkgs.zsh;
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "marcin";
  };
}
