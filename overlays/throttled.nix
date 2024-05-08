{ prev }:

# TODO https://github.com/NixOS/nixpkgs/pull/309377
prev.throttled.overrideAttrs (old: {
  nativeBuildInputs = old.nativeBuildInputs ++ [ prev.gobject-introspection prev.wrapGAppsHook3 ];
  dontWrapGApps = true;

  preFixup = ''
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")
  '';  
})
