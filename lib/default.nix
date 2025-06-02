{
  lib,
  ...
}:

rec {
  colors = import ./colors.nix { inherit lib; };
  math = import ./math.nix;

  allExceptThisDefault =
    dir:
      (builtins.readDir dir)
      |> (attrs: builtins.removeAttrs attrs [ "default.nix" ])
      |> builtins.attrNames
      |> map (entry: "${toString dir}/${entry}");
  flakeRoot = "${toString ./.}/..";
  mkMergeRecursive = attrList:
    let f = attrPath:
      lib.zipAttrsWith (n: values:
        if lib.tail values == []
          then lib.head values
        else if lib.all lib.isList values
          then lib.unique (lib.concatLists values)
        else if lib.all lib.isAttrs values
          then f (attrPath ++ [n]) values
        else lib.last values
      );
    in f [] attrList;
  mkOptionSimple = type: lib.mkOption {
    inherit type;
  };
  mkOptionSimpleDefault = type: default: lib.mkOption {
    inherit type default;
  };
  mkProgramOption = {
    name,
    optionName ? lib.replaceStrings [ " " ] [ "-" ] (lib.toLower name),
    package ? null,
    packages ? [ ],
    persistentDirectories ? [ ],
    persistentFiles ? [ ],
    customConfig ? { }
  }: {
    imports = [
      (
        {
          config,
          ...
        }:

        {
          options.custom.programs.${optionName}.enable = lib.mkEnableOption name;
          config = lib.mkIf
            config.custom.programs.${optionName}.enable
            (
              mkMergeRecursive
                [
                  {
                    home.packages = if package != null then [ package ] else packages;
                    persistence = {
                      directories = persistentDirectories;
                      files = persistentFiles;
                    };
                  }
                  customConfig
                ]
            );
        }
      )
    ];
  };
}