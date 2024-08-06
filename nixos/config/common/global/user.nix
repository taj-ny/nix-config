{
  config,
  inputs,
  nix-colors,
  outputs,
  pkgs,
  ...
}:

let
  username = "marcin";
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs nix-colors outputs username; };
    useGlobalPkgs = true;

    users.marcin = (import (./. + "../../../../../home/config/${config.networking.hostName}/default.nix"));
  };

  users.users.${username} = {
    isNormalUser = true;
    hashedPasswordFile = "/nix/persist/passwords/${username}";
    extraGroups = [ "wheel" "adbusers" ];
    shell = pkgs.zsh;

    openssh.authorizedKeys.keys = [
      ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIrMW7NUE7i3/6AksQmq34RK1xL2krFA0ljv8AiPho9Z marcin@andromeda''
    ];
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = username;
  };
}
