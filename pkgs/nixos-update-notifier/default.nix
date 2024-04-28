{ stdenv
, lib
, libnotify
}:

stdenv.mkDerivation rec {
  pname = "nixos-update-notifier";
  version = "1.0.0";

  src = ./.;

  propagatedBuildInputs = [ libnotify ];

  prePatch = ''
    substituteInPlace nixos-update-notifier.py \
      --replace "notify-send" "${libnotify}/bin/notify-send"
  '';

  installPhase = ''
    mkdir $out
    cp nixos-update-notifier.py $out
  '';
}
