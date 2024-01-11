{ prev }:

prev.plasma5Packages.plasma5.kwin.overrideAttrs (old: {
  patches = (old.patches or []) ++ [ ./force-blur.patch ];
})
