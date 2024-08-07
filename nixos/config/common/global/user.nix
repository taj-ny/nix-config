{
  config,
  inputs,
  lib,
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
    useGlobalPkgs = true;

    extraSpecialArgs = {
      inherit inputs nix-colors outputs username;

      lib = lib.extend (_: _: inputs.home-manager.lib);
    };

    users.${username}.imports = [
      "${lib.flakeRoot}/home/config/common/default.nix"
      "${lib.flakeRoot}/home/config/${config.networking.hostName}/default.nix"
    ] ++ (builtins.attrValues outputs.homeManagerModules);
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
