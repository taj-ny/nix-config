{ lib, ... }:

{
  services.syncthing = {
    enable = true;
    user = "marcin";
    dataDir = "/home/marcin";
    configDir = "/home/marcin/.syncthing";
    overrideDevices = true;
    overrideFolders = true;

    settings = {
      devices = {
        andromeda.id = "SUIYSAQ-STGZIJU-JI3DTRF-4IG4RNS-B4CMRGW-ZZICAON-AJG3V5O-I6G4NAD";
        thinkpad.id = "XGRKJG4-4MPADC4-4AN4W54-7RKSAMP-SMZ73JU-QJTHPHA-XR3FK44-3ZTY2A6";
        rn10pro.id = "AS2WNCA-QXU3JIN-5DTUNAO-5OIEQTV-LTZK6CI-ZZFAML6-6OLLEAH-VC3JUQU";
      };

      folders = {
        keepass = {
          path = "/home/marcin/keepass";
          devices = [ "andromeda" "thinkpad" ];
          ignorePerms = false;
          ignoreDelete = true;

          versioning = {
            type = "simple";
            params.keep = "10";
          };
        };
      };
    };
  };
}
