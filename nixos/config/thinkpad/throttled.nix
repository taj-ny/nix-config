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
        cache = 50;
        core = 100;
        gpu = 0;
      };

      battery = {
        cache = 100;
        core = 100;
        gpu = 50;
      };
    };
  };
}
