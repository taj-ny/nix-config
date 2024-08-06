{
  nix-colors,
  ...
}:

{
  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = {
    palette = {
      accent = "009688";
      accentDark = "008B7D";
      accentDarker = "008779";

      accentBrighter = "00988A";
    };
  };
}