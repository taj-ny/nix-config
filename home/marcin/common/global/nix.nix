{ osConfig, ... }:

{
  nixpkgs = {
    inherit (osConfig.nixpkgs) overlays config;
  };

  nix.gc = {
    inherit (osConfig.nix.gc) automatic options;
    frequency = osConfig.nix.gc.dates;
  };
}
