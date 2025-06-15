{
  home.file.".config/kwingestures.yml".text = builtins.toJSON {
    touchpad.gestures = [
      {
        type = "swipe";
        conditions = [
          "$fingers == 3"
          "$window_class == firefox"
        ];
        gestures = [
          {
            direction = "left";
            actions = [
              {
                on = "begin";
                input = [
                  {
                    mouse = [ "back" ];
                  }
                ];
              }
            ];
          }
          {
            direction = "right";
            actions = [
              {
                on = "begin";
                input = [
                  {
                    mouse = [ "forward" ];
                  }
                ];
              }
            ];
          }
          {
            direction = "down";
            actions = [
              {
                on = "begin";
                input = [
                  {
                    keyboard = [ "f5" ];
                  }
                ];
              }
            ];
          }
        ];
      }
    ];
  };
  programs.plasma.configFile.kwinrc.Plugins.kwin_gesturesEnabled.value = true;
}