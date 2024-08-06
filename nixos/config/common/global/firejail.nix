{
  programs.firejail.enable = true;

  environment.etc."firejail.config".text = ''
    browser-allow-drm yes
  '';
}