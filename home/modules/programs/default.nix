{
  lib,
  ...
}:

{
  imports = (lib.allExceptThisDefault ./.);
}
