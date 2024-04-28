{
  programs.nixos-update-notifier = {
    enable = true;
    watchedFlakeInputs = [
      "firefox-addons"
      "firefox-ui-fix"
      "hardware"
      "kwin-effects-forceblur"
      "kwin-effects-startupfeedback-busy-cursor"
      "lanzaboote"
      "impermanence"
      "nixpkgs"
      "nixpkgs-23-11"
      "nixvim"
      "plasma-manager"
    ];
  };
}
