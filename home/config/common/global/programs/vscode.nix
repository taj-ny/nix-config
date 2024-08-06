{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];

    userSettings = {
      "material-icon-theme.folders.theme" = "classic";
      "material-icon-theme.folders.color" = "#009688";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
      "workbench.iconTheme" = "material-icon-theme";
    };
  };
}
