{ inputs, ... }:

{
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    cryptomator = import ./cryptomator { inherit prev; };

    libsForQt5 = prev.libsForQt5 // {
      kwin = import ./kwin.nix { inherit prev; };
    };

    plasma5Packages = prev.plasma5Packages // {
      plasma5 = prev.plasma5Packages.plasma5 // {
        kwin = import ./kwin.nix { inherit prev; };
      };
    };
  };

  # Accessible through pkgs.stable
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
