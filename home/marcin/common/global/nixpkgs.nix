{ outputs, ... }:

{
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.channels
      outputs.overlays.modifications
    ];

    config.allowUnfree = true;
  };
}
