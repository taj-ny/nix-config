let
  general = {
    disableBdProchot = true;
    maxTemperature = 88;
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
        cache = 80;
        core = 80;
        gpu = 30;
      };
    };
  };
}
