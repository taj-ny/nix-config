{
  inputs,
  lib,
  ...
}:

let
  nixpkgsVariants = [ "stable" "working" ];
in
{
  additions = final: _prev: import ../pkgs {
    inherit lib;
    pkgs = final;
  };
  modifications = final: prev: {
    kde-rounded-corners = (import ./kde-rounded-corners) prev;
    plasma-panel-colorizer = (import ./plasma-panel-colorizer.nix) prev;
    thinkfan = (import ./thinkfan.nix) prev;
  } // (
    lib.optionalAttrs
      (builtins.pathExists ./private)
      (import ./private { inherit final prev; })
  );
  variants = final: prev:
    nixpkgsVariants
    |> builtins.map
      (
        variant: {
          name = variant;
          value = import inputs."nixpkgs-${variant}" {
            system = final.system;
            config.allowUnfree = true;
          };
        }
      )
    |> builtins.listToAttrs;
}
