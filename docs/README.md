# Directory structure
- **disks** - Disko configurations, not used in a long time
- **home**
    - **config** - Home Manager configurations
        - **_shared** - Imported automatically for every Home Manager configuration
        - **${name}/default.nix** - A Home Manager configuration for a particular NixOS configuration (*name*). If this file does not exist, Home Manager will not be used.
    - **modules** - Home Manager modules
- **nixos**
    - **config** - NixOS configurations
        - **_shared**
            - **desktop** - Optional configuration for desktops
            - **global** - Imported automatically for every NixOS configuration
                - **user.nix** - User configuration
            - **optional** - Deprecated, will eventually be replaced with modules
        - **${name}/default.nix** - A NixOS configuration, available immediately after creation of the file
    - **modules** - NixOS modules
- **overlays**
- **pkgs**

Files and directories matching ``**/private`` and ``*-private*`` are ignored. This is not meant to be used for secrets.

# Auto-import
All ``*.nix`` and ``*/default.nix`` files in the current directory can be imported automatically using ``lib.allExceptThisDefault``:
```nix
{
    imports = lib.allExceptThisDefault ./.;
}
```

# Installation
TODO

# Scripts
- ``./build.sh [configuration]`` - Builds the specified configuration, or ``$HOST`` if not specified.
- ``./switch.sh [configuration]`` - Builds and switches to the specified configuration , or ``$HOST`` if not specified. Automatically finds substituters.