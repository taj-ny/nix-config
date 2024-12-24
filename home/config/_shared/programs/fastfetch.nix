{
  pkgs,
  ...
}:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "iterm";
        source = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        width = 40;
        height = 20;
      };
      display = {
        separator = "  ";
        constants = [ "─────────────────" ];
        key = {
          type = "icon";
          paddingLeft = 2;
        };
      };
      modules = [
        {
          type = "custom";
          format = "┌{$1} {#1}Hardware Information{#} {$1}┐";
        }
        "host"
        "cpu"
        "gpu"
        "disk"
        "memory"
        "swap"
        "display"
        {
          type = "custom";
          format = "├{$1} {#1}Software Information{#} {$1}┤";
        }
        {
          type = "title";
          keyIcon = "";
          key = "Title";
          format = "{user-name}@{host-name}";
        }
        "os"
        "kernel"
        "de"
        "wm"
        "shell"
        "terminal"
        "terminalfont"
        "theme"
        "icons"
        "packages"
        "uptime"
        {
            type = "custom";
            format = "└{$1}──────────────────────{$1}┘";
        }
        {
            type = "colors";
            paddingLeft = 17;
        }
      ];
    };
  };
}