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

      function writeConfig(widget, config, group) {
          if (group == null)
              group = widget.currentConfigGroup;

          for (const [key, value] of Object.entries(config)) {
              if (typeof value == "object")
                  writeConfig(widget, value, group.concat([ key ]));
              else {
                  widget.currentConfigGroup = group;
                  widget.writeConfig(key, value);
              }
          }
      }

      ${if (cfg.appearance.wallpaper.image == null) then "" else ''
          for (const desktop of desktopsForActivity(currentActivity())) {
              writeConfig(desktop, {
                  plugin: "org.kde.desktopcontainment",
                  wallpaperplugin: "org.kde.image",

                  Wallpaper: {
                      "org.kde.image": {
                          General: {
                              Image: "${cfg.appearance.wallpaper.image}",
                              PreviewImage: "${cfg.appearance.wallpaper.image}"
                          }
                      }
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
                # Every time the layout script is evaluate, the size of this file increases, which in turn causes
                # plasmashell to take longer to start.
                rm -f ~/.config/plasma-org.kde.plasma.desktop-appletsrc

                # Plasmashell stores a copy of the above file in memory and will write it back when refreshed.
                ${pkgs.procps}/bin/pkill -9 plasmashell
                PATH="/run/current-system/sw/bin:${config.home.path}/bin:$PATH" ${pkgs.plasma-workspace}/bin/.plasmashell-wrapped > /dev/null 2>&1 & disown

                while ! ${pkgs.procps}/bin/pgrep plasmashell > /dev/null; do sleep 0.1; done
                while [ ! -f ~/.config/plasma-org.kde.plasma.desktop-appletsrc ]; do sleep 0.1; done

                ${pkgs.libsForQt5.qt5.qttools.bin}/bin/qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '${mkLayoutScript cfg.appearance.layout.panels}'
            fi
          '');
        };
      };
  };
}
