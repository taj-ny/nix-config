{ inputs, ... }:

rec {
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    kde-rounded-corners = import ./kde-rounded-corners { inherit prev; };

    # Use Plasma 6.0.5 for now, as 6.1 is very buggy. Note that some flake inputs must follow nixpkgs-stable.
    kdePackages = (stable final prev).stable.kdePackages // { 
      krdp = prev.kdePackages.krdp; 
    };
  };

  stable = final: prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
