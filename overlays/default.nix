{ inputs, ... }:

{
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    cryptomator = import ./cryptomator { inherit prev; };
  };

  # Accessible through pkgs.stable
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
