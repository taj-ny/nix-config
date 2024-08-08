{
  config,
  pkgs,
  ...
}:

{
  programs.vscode = {
    extensions =
      with pkgs;
      with vscode-extensions;
      [
        vscode-taskexplorer

        jnoortheen.nix-ide
        pkief.material-icon-theme
        shd101wyy.markdown-preview-enhanced
      ];
    userSettings = {
      "editor.bracketPairColorization.enabled" = false;
      "editor.fontFamily" = "'JetBrains Mono'";
      "editor.wordWrap" = "on";
      "files.autoSave" = "afterDelay";
      "files.trimTrailingWhitespace" = true;
      "markdown-preview-enhanced.previewTheme" = "github-dark.css";
      "material-icon-theme.folders.color" = "#${config.colorScheme.palette.accent}";
      "material-icon-theme.folders.theme" = "classic";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
      "nix.serverSettings".nixd.options = {
        home.expr = "(builtins.getFlake \"/nix/config\").homeConfigurations.nixd.options";
        nixos.expr = "(builtins.getFlake \"/nix/config\").nixosConfigurations.andromeda.options";
      };
      "terminal.integrated.fontFamily" = "MesloLGS NF";
      "terminal.integrated.fontSize" = 13;
      "terminal.integrated.lineHeight" = 1;
      "workbench.colorCustomizations" = {
        "activityBar.activeBorder" = "#${config.colorScheme.palette.accent}";
        "activityBar.foreground" = "#${config.colorScheme.palette.accent}";
        "activityBarBadge.background" = "#${config.colorScheme.palette.accent}";
        "button.background" = "#${config.colorScheme.palette.accent}";
        "button.hoverBackground" = "#${config.colorScheme.palette.accentDark}";
        "button.secondaryBackground" = "#${config.colorScheme.palette.accent}";
        "editor.selectionBackground" = "#${config.colorScheme.palette.accent}";
        "focusBorder" = "#${config.colorScheme.palette.accent}";
        "list.activeSelectionBackground" = "#${config.colorScheme.palette.accentDarker}";
        "list.focusAndSelectionOutline" = "#${config.colorScheme.palette.accent}";
        "panelTitle.activeBorder" = "#${config.colorScheme.palette.accent}";
        "tab.activeBorder" = "#${config.colorScheme.palette.accent}";
        "terminal.tab.activeBorder" = "#${config.colorScheme.palette.accent}";
        "textLink.activeForeground" = "#${config.colorScheme.palette.accentDark}";
        "textLink.foreground" = "#${config.colorScheme.palette.accent}";
        "selection.background" = "#${config.colorScheme.palette.accent}";
        "statusBarItem.remoteBackground" = "#${config.colorScheme.palette.accent}";
        "statusBarItem.remoteHoverBackground" = "#${config.colorScheme.palette.accentDark}";
        "window.activeBorder" = "#${config.colorScheme.palette.accent}";
      };
      "workbench.iconTheme" = "material-icon-theme";
    };
    package = pkgs.vscodium;
  };
}
