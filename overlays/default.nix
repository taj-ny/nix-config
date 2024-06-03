{ inputs, ... }:

{
  additions = final: _prev: import ../pkgs { pkgs = final; };

  channels = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  modifications = final: prev: {
    cryptomator = import ./cryptomator { inherit prev; };
  };
}
