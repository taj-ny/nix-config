{ prev }:

prev.kde-rounded-corners.overrideAttrs (old: {
  patches = (old.patches or []) ++ [ ./dont-mark-windows-as-translucent.patch ];
})
