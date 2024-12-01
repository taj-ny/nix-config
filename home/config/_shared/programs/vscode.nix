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
      "terminal.integrated.fontFamily" = "MesloLGS NF";
      "terminal.integrated.fontSize" = 13;
      "terminal.integrated.lineHeight" = 1;
      "terminal.integrated.smoothScrolling" = true;
      "workbench.colorCustomizations" = {
        "activityBar.activeBorder" = colors.accent;
        "activityBar.background" = colors.background;
        "activityBar.foreground" = colors.accent;
        "activityBarBadge.background" = colors.accent;
        "button.background" = colors.accent;
        "button.hoverBackground" = colors.accentDark1;
        "button.secondaryBackground" = colors.accent;
        "editor.background" = colors.backgroundLight1;
        "editor.selectionBackground" = colors.accent;
        "files.autoSaveDelay" = 250;
        "focusBorder" = colors.accent;
        "list.activeSelectionBackground" = colors.accentDark2;
        "list.focusAndSelectionOutline" = colors.accent;
        "list.hoverBackground" = colors.backgroundLight1; # Also affects notifications
        "list.inactiveSelectionBackground" = colors.backgroundLight2;
        "notifications.background" = colors.background;
        "panelTitle.activeBorder" = colors.accent;
        "tab.activeBackground" = colors.backgroundLight1;
        "tab.activeBorder" = colors.backgroundLight1;
        "tab.activeBorderTop" = colors.backgroundLight1;
        "tab.hoverBackground" = colors.backgroundLight2;
        "terminal.tab.activeBorder" = colors.accent;
        "textLink.activeForeground" = colors.accentDark1;
        "textLink.foreground" = colors.accent;
        "selection.background" = colors.accent;
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