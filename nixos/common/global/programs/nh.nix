let
  flake = "/nix/config";
in
{
  environment.variables.FLAKE = flake;

  programs.nh = {
    inherit flake;
    enable = true;
  };
}
