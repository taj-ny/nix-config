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

  # TODO Deduplicate
  nix.gc = {
    automatic = true;
    frequency = "daily";
    options = "--delete-older-than 7d";
  };
}
