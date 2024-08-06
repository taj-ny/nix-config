{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ pam_u2f ];
  services.udev.packages = with pkgs; [ pam_u2f ];

  security.pam = {
    u2f = {
      enable = true;
      control = "required";

      settings = {
        authfile = "/nix/persist/u2f_keys";
        cue = true;
        interactive = true;
      };
    };

    services = {
      kde.u2fAuth = false;
      login.u2fAuth = false;
    };
  };
}
