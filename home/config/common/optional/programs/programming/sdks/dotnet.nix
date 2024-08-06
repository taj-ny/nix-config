{ pkgs, ... }:

let
  dotnet-combined = with pkgs; (dotnetCorePackages.combinePackages [
    dotnet-sdk_7
    dotnet-sdk_8
  ]);
in
{
  home.sessionVariables.DOTNET_ROOT = "${dotnet-combined}";
  home.packages = with pkgs; [
    mono
    #msbuild

    dotnet-combined
  ];
}
