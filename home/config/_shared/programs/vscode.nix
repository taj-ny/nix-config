{
  config,
  lib,
  pkgs,
  ...
}:

let
  colors = lib.attrsets.mapAttrs (_: color: "#${lib.colors.rgbToHex color}") config.colors;
in
lib.mkIf config.programs.vscode.enable
{
  home.sessionVariables.NIXD_FLAGS = "--semantic-tokens=true";
  persistence.directories = [
    ".config/VSCodium/User/globalStorage"
    ".config/VSCodium/User/History"
    ".config/VSCodium/User/workspaceStorage"
    ".vscode-oss/extensions"
  ];
  programs.vscode = {
    extensions =
      with pkgs;
      with vscode-extensions;
      [
        vscode-taskexplorer

        james-yu.latex-workshop
        jnoortheen.nix-ide
        ms-vscode.cmake-tools
        ms-vscode.cpptools
        pkief.material-icon-theme
        shd101wyy.markdown-preview-enhanced
      ];
    userSettings = {
      "editor.bracketPairColorization.enabled" = false;
      "editor.fontFamily" = "'JetBrains Mono'";
      "editor.lineHeight" = 1.5;
      "editor.smoothScrolling" = true;
      "editor.wordWrap" = "on";
      "files.autoSave" = "afterDelay";
      "files.trimTrailingWhitespace" = true;
      "markdown-preview-enhanced.previewTheme" = "github-dark.css";
      "material-icon-theme.folders.color" = colors.accent;
      "material-icon-theme.folders.theme" = "classic";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
      "nix.serverSettings".nixd.options = {
        home.expr = "(builtins.getFlake \"/nix/config\").homeConfigurations.nixd.options";
        nixos.expr = "(builtins.getFlake \"/nix/config\").nixosConfigurations.andromeda.options";
      };
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.cursorStyle" = "line";
      "terminal.integrated.cursorStyleInactive" = "none";
      "terminal.integrated.fontFamily" = "'MesloLGS NF'";
      "terminal.integrated.fontSize" = 13;
      "terminal.integrated.lineHeight" = 1;
      "terminal.integrated.smoothScrolling" = true;
      "workbench.colorCustomizations" = {
        "activityBar.activeBorder" = colors.background;
        "activityBar.background" = colors.background;
        "activityBar.foreground" = colors.accent;
        "activityBarBadge.background" = colors.accent;
        "button.background" = colors.accent;
        "button.hoverBackground" = colors.accentDark1;
        "button.secondaryBackground" = colors.accent;
        "editorError.foreground" = colors.redLight1;
        "editor.background" = colors.backgroundLight1;
        "editor.selectionBackground" = colors.accentDark3;
        "files.autoSaveDelay" = 250;
        "focusBorder" = colors.accent;
        "gitDecoration.addedResourceForeground" = colors.greenLight1;
        "gitDecoration.modifiedResourceForeground" = colors.blueLight1;
        "gitDecoration.untrackedResourceForeground" = colors.greenLight1;
        "inputOption.activeBackground" = colors.accentDark2;
        "inputOption.activeBorder" = colors.accentLight1;
        "list.activeSelectionBackground" = colors.accentDark2;
        "list.errorForeground" = colors.red;
        "list.focusAndSelectionOutline" = colors.accent;
        "list.hoverBackground" = colors.backgroundLight1; # Also affects notifications
        "list.inactiveSelectionBackground" = colors.backgroundLight2;
        "notifications.background" = colors.background;
        "panelTitle.activeBorder" = colors.accent;
        "tab.activeBackground" = colors.backgroundLight1;
        "tab.activeBorder" = colors.backgroundLight1;
        "tab.activeBorderTop" = colors.backgroundLight1;
        "tab.hoverBackground" = colors.backgroundLight2;
        "terminal.ansiBrightBlue" = colors.blueLight1;
        "terminal.ansiBrightCyan" = colors.accentLight1;
        "terminal.ansiBrightGreen" = colors.greenLight1;
        "terminal.ansiBrightMagenta" = colors.purpleLight1;
        "terminal.ansiBrightRed" = colors.redLight1;
        "terminal.ansiBrightYellow" = colors.orangeLight1;
        "terminal.ansiBlue" = colors.blue;
        "terminal.ansiCyan" = colors.accent;
        "terminal.ansiGreen" = colors.green;
        "terminal.ansiMagenta" = colors.purple;
        "terminal.ansiRed" = colors.red;
        "terminal.ansiYellow" = colors.orange;
        "terminal.tab.activeBorder" = colors.accent;
        "textLink.activeForeground" = colors.accentDark1;
        "textLink.foreground" = colors.accent;
        "selection.background" = colors.accentDark3;
        "sideBar.background" = colors.background;
        "statusBarItem.remoteBackground" = colors.accent;
        "statusBarItem.remoteHoverBackground" = colors.accentDark1;
        "terminal.background" = colors.background;
        "window.activeBorder" = colors.background;
      };
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.list.smoothScrolling" = true;
    };
    package = pkgs.vscodium;
  };
}