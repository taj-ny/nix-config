{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      shd101wyy.markdown-preview-enhanced
    ];

    userSettings = {
      "markdown-preview-enhanced.previewTheme" = "github-dark.css";
      "material-icon-theme.folders.theme" = "classic";
      "material-icon-theme.folders.color" = "#009688";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
      "terminal.integrated.fontFamily" = "MesloLGS NF";
      "terminal.integrated.fontSize" = 13;
      "terminal.integrated.lineHeight" = 1;
      "workbench.iconTheme" = "material-icon-theme";
    };
  };
}
