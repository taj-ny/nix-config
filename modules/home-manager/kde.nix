{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.desktop.kde;

  mkLayoutScript = panels:
    let
      panelsStr = lib.strings.concatStringsSep "\n" (
        lib.forEach panels (panel:
          let
            widgets = lib.forEach panel.widgets (widget:
              "widget(`${widget.name}`, ${builtins.toJSON widget.config})"
            );
          in
          "panel(${toString panel.height}, [ ${lib.strings.concatStringsSep ", " widgets} ]);"
        )
      );
    in
    ''
      function panel(height, widgets) {
          const panel = new Panel;
          panel.height = height;

          for (const widget of widgets) {
              const addedWidget = panel.addWidget(widget.widgetName);
              if (widget.config)
                  writeConfig(addedWidget, widget.config);
          }
      }

      for (let panel of panels()) {
          panel.remove();
      }

      function widget(widgetName, config) {
          return { widgetName, config };
      }

      function writeConfig(object, config) {
          const originalConfigGroup = object.currentConfigGroup;
          for (const [group, values] of Object.entries(config)) {
              object.currentConfigGroup = group == null ? [] : group.split(" -> ");
              for (const [key, value] of Object.entries(values))
                  object.writeConfig(key, value);
          }
      }

      ${if (cfg.appearance.wallpaper.image == null) then "" else ''
          for (const desktop of desktopsForActivity(currentActivity())) {
              writeConfig(desktop, {
                  null: {
                      plugin: "org.kde.desktopcontainment",
                      wallpaperPlugin: "org.kde.image"
                  },
                  "Wallpaper -> org.kde.image -> General": {
                      Image: "${cfg.appearance.wallpaper.image}",
                      PreviewImage: "${cfg.appearance.wallpaper.image}"
                  }
              });
          }
      ''}

      ${panelsStr}
    '';
in
{
  options.desktop.kde = with types; {
    configs = mkOption {
      type = attrsOf anything;
      default = {};
    };

    appearance = {
      gtk.useBreezeTheme = mkEnableOption "TODO";

      wallpaper = {
        image = mkOption {
          type = nullOr str;
          default = null;
        };
      };

      layout.panels = mkOption {
        type = listOf (attrsOf anything);
        default = [];
      };
    };
  };

  config = {
    gtk = mkIf cfg.appearance.gtk.useBreezeTheme {
      enable = true;
      theme = {
        package = pkgs.breeze-gtk;
        name = "Breeze";
      };
    };

    home =
      let
        toValue = v:
          if v == null then
            "--delete"
          else if isString v then
            "'${v}'"
          else if isBool v then
            "--type bool ${boolToString v}"
          else if isInt v then
            toString v
          else
            abort "Invalid value type: ${toString v}";

        lines = flatten (
          mapAttrsToList (file: groups:
            mapAttrsToList (group: keys:
              let
                # This is terrible, but I didn't want to spend too much time doing this the proper way
                groupArgs = lib.strings.concatMapStrings (x: "--group '${x}' ") (lib.strings.splitString " -> " group);
              in
                mapAttrsToList (key: value: ''
                  (test -f ~/.config/'${file}' || (mkdir -p "$(dirname ~/.config/'${file}')" && touch ~/.config/'${file}')) && ${pkgs.libsForQt5.kconfig}/bin/kwriteconfig5 --file ~/.config/'${file}' ${groupArgs}--key '${key}' ${toValue value}
                '') keys
            ) groups
          ) cfg.configs
        );
      in
      {
        activation = {
          kdeConfigs = lib.hm.dag.entryAfter [ "writeBoundary" ] (concatStringsSep "\n" lines);

          # Only works for one user
          layout = mkIf (length cfg.appearance.layout.panels > 0) (lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            if [[ ! -z "''${DISPLAY+x}" ]]; then
                ${pkgs.libsForQt5.qt5.qttools.bin}/bin/qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '${mkLayoutScript cfg.appearance.layout.panels}'
            fi
          '');
        };
      };
  };
}
