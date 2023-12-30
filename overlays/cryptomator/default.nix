{ prev }:

prev.cryptomator.overrideAttrs (old: {
  patches = (old.patches or []) ++ [ ./supporter-certificate.patch ];
})
