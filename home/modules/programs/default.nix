{
  lib,
  ...
}:

{
  imports = lib.allExceptThisDefault ./.;
}
