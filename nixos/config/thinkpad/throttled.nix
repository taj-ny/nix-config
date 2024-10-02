let
  general = {
    disableBdProchot = true;
    maxTemperature = 97;
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
        core = 125;
        gpu = 75;
      };

      battery = {
        cache = 100;
        core = 100;
        gpu = 75;
      };
    };
  };
}
