let
  general = {
    disableBdProchot = true;
    maxTemperature = 90;
  };
in
{
  custom.services.throttled = {
    enable = true;

    general = {
      ac = general;
      battery = general;
    };

    undervolt = {
      ac = {
        cache = 100;
        core = 100;
        gpu = 50;
      };

      battery = {
        cache = 100;
        core = 100;
        gpu = 50;
      };
    };
  };
}
