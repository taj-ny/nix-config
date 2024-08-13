{
  lib,
  ...
}:

with lib;
with types;
rec {
  allExceptThisDefault = dir:
    map (entry:
      "${toString dir}/${entry}"
    ) (
      builtins.attrNames (
        builtins.removeAttrs (
          builtins.readDir dir
        ) [ "default.nix" ]
      )
    );

  flakeRoot = "${toString ./.}/..";
  mkOptionSimple = type: mkOption {
    inherit type;
  };
  mkOptionSimpleDefault = type: default: mkOption {
    inherit type default;
  };
}