{
  config,
  lib,
  ...
}:

with lib;
let
  cfg = config.custom.programs.vscode;
in
{
  options.custom.programs.vscode.enable = mkEnableOption "Visual Studio Code";

  config = mkIf cfg.enable {
    programs.vscode.enable = true;
    custom.impermanence.persistentDirectories = [
      ".config/VSCodium/User/globalStorage"
      ".config/VSCodium/User/History"
      ".config/VSCodium/User/workspaceStorage"
    ];
  };
}
