{
  lib,
  ...
}:

rec {
  allExceptThisDefault =
    dir:
      map
        (entry: "${toString dir}/${entry}")
        (
          builtins.attrNames
          (
            builtins.removeAttrs
              (builtins.readDir dir)
               [ "default.nix" ]
          )
        );
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
          options.programs.${optionName}.enable = lib.mkEnableOption name;
          config = lib.mkIf
            config.programs.${optionName}.enable
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