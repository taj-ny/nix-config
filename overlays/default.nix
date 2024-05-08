{ inputs, ... }:

{
  additions = final: _prev: import ../pkgs { pkgs = final; };

  channels = final: _prev: {
    "23-11" = import inputs."nixpkgs-23-11" {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  modifications = final: prev: {
    cryptomator = import ./cryptomator { inherit prev; };
    throttled = import ./throttled.nix { inherit prev; };
  };
}
