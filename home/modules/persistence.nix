{
  lib,
  ...
}:

{
  options.persistence = with lib.types; {
    directories = lib.mkOptionSimpleDefault (listOf str) [ ];
    files = lib.mkOptionSimpleDefault (listOf str) [ ];
  };
}
