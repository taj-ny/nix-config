{
  lib,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;
}