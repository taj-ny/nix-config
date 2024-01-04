{ lib, outputs, ... }:

{
  imports = [
    ./boot.nix
    ./doas.nix
    ./firejail.nix
    ./fonts.nix
    ./impermanence.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./no-root-login.nix
    ./opengl.nix
    ./preload.nix
    ./printing.nix
    ./ssh.nix
    ./systemd.nix
    ./yubikey.nix
    ./zsh.nix

    ./programs
  ] ++ (builtins.attrValues outputs.nixosModules);

  # Sometimes prevents executables from being started even if steam-run is used. Affects dotnet's ilc. 
  environment.stub-ld.enable = lib.mkForce false;
}
