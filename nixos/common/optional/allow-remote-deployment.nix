{
  users = {
    groups.nixdeploy = {};
    users.nixdeploy = {
      isSystemUser = true;
      group = "nixdeploy";

      openssh.authorizedKeys.keys = [
        ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIrMW7NUE7i3/6AksQmq34RK1xL2krFA0ljv8AiPho9Z marcin@andromeda''
      ];
    };
  };

  nix.settings.trusted-users = [ "nixdeploy" ];
}
