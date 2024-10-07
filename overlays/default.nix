{
  inputs,
  lib,
  ...
}:

{
  additions = final: _prev: import ../pkgs {
    inherit lib;
    pkgs = final;
  };
  modifications = final: prev: {
    kde-rounded-corners = (import ./kde-rounded-corners) prev;
  } // (
    lib.optionalAttrs
      (builtins.pathExists ./private)
      (import ./private { inherit final prev; })
  );
  stable = final: prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
