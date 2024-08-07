let
  en = "en_US.UTF-8";
  pl = "pl_PL.UTF-8";
in
{
  i18n = {
    defaultLocale = en;

    extraLocaleSettings = {
      LC_ADDRESS = pl;
      LC_MEASUREMENT = pl;
      LC_MONETARY = pl;
      LC_NUMERIC = pl;
      LC_PAPER = pl;
      LC_TELEPHONE = pl;
      LC_TIME = pl;
    };

    supportedLocales = [
      "${en}/UTF-8"
      "${pl}/UTF-8"
    ];
  };

  time.timeZone = "Europe/Warsaw";
}
