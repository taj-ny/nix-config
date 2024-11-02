{
  config,
  ...
}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ config.home.wallpaper ];
      wallpaper = ", ${config.home.wallpaper}";
    };
  };
}