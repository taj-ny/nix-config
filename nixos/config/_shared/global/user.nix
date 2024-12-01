{
  config,
  inputs,
  lib,
  outputs,
  pkgs,
  ...
}:

let
  homeConfig = "${lib.flakeRoot}/home/config/${config.networking.hostName}";
  username = "marcin";
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  # TODO Use lib.mkMerge
  environment.persistence."/nix/persist".users.${username} = lib.mkIf (builtins.pathExists homeConfig) {
    directories = lib.lists.unique config.home-manager.users.${username}.persistence.directories;
    files = lib.lists.unique config.home-manager.users.${username}.persistence.files;
  };
  home-manager = lib.mkIf (builtins.pathExists homeConfig) {
    extraSpecialArgs = {
      inherit inputs outputs username;
      lib = lib.extend (_: _: inputs.home-manager.lib);
    };
    useGlobalPkgs = true;
    users.${username}.imports = [
      "${lib.flakeRoot}/home/config/_shared"
      homeConfig
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
  system.userActivationScripts.removeConflictingFiles.text = ''
    rm .gtkrc-2.0
  '';
}