{
  imagemagick,
  stdenv
}:

stdenv.mkDerivation {
  pname = "wallpaper";
  version = "1.0.0";

  dontUnpack = true;

  nativeBuildInputs = [ imagemagick ];

  buildPhase = ''
    runHook preBuild

    magick \( xc:'#008478' xc:'#009668' +append \) \
      \( xc:'#00306B' xc:'#001E28' +append \) -append \
      -size 1920x1080 xc: +swap -fx 'v.p{i/(w-1),j/(h-1)}' \
      wallpaper.png;

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp wallpaper.png $out

    runHook postInstall
  '';
}
