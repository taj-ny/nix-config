{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ pam_u2f ];
  services.udev.packages = with pkgs; [ pam_u2f ];

  security.pam = {
    u2f = {
      enable = true;
      cue = true;
      interactive = true;
      control = "required";
      authFile = "/persist/u2f_keys";
    };

    services.kde.u2fAuth = false;
  };
}
