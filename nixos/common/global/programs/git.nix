{
  programs.git = {
    enable = true;

    config = {
      user = {
        email = "79316397+taj-ny@users.noreply.github.com";
        name = "taj-ny";
      };

      push.autoSetupRemote = true;
      safe.directory = "/nix/config";
    };
  };
}
