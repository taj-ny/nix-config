{ inputs, ... }:

rec {
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    kde-rounded-corners = import ./kde-rounded-corners { inherit prev; };
  };

  stable = final: prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
