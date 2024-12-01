{
  lib,
  ...
}:

{
  options.colors = lib.mkOption {
    type = lib.types.attrsOf (lib.types.listOf lib.types.ints.u8);
  };
}