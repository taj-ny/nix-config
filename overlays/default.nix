{ inputs, ... }:

{
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    cryptomator = import ./cryptomator { inherit prev; };
  };
}
