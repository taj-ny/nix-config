{ pkgs, ... }:

let
  dotnet-combined = with pkgs; (dotnetCorePackages.combinePackages [
    dotnet-sdk_7
    dotnet-sdk_8
  ]).overrideAttrs (finalAttrs: previousAttrs: {
    # This is needed to install workload in $HOME
    # https://discourse.nixos.org/t/dotnet-maui-workload/20370/2
    # (doesn't actually work)

    postBuild = (previousAttrs.postBuild or '''') + ''

      for i in $out/sdk/*
      do
        i=$(basename $i)
        mkdir -p $out/metadata/workloads/''${i/-*}
        touch $out/metadata/workloads/''${i/-*}/userlocal
      done
    '';
  });
in
{
  home.sessionVariables.DOTNET_ROOT = "${dotnet-combined}";
  home.packages = with pkgs; [
    mono
    #msbuild

    dotnet-combined
  ];
}
