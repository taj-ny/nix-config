{ inputs, ... }:

{
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    cryptomator = import ./cryptomator { inherit prev; };
  };

  channels = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
    staging-next = import inputs.nixpkgs-staging-next {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
