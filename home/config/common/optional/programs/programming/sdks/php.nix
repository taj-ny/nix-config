{ pkgs, ... }:

{
  home.packages = with pkgs; [ php ];
}
