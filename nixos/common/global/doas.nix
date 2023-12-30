{ lib, ... }:

{
  security = {
    doas.enable = true;
    sudo.enable = lib.mkForce false;
  };
}
