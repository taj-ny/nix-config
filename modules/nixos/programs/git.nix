{ config, lib, ... }:

with lib;
let
  cfg = config.modules.programs.git;
in
{
  options.modules.programs.git.enable = mkEnableOption "Git";

  config.programs.git = mkIf cfg.enable {
    enable = true;

    config = {
      user = {
        email = "79316397+taj-ny@users.noreply.github.com";
        name = "taj-ny";
      };

      push.autoSetupRemote = true;
      rebase.autoStash = true;
      safe.directory = "*";
    };
  };
}
