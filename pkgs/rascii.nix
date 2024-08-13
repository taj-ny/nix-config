{
  lib,
  fetchFromGitHub,
  rustPlatform
}:

rustPlatform.buildRustPackage rec {
  pname = "rascii";
  version = "0.3.4";

  src = fetchFromGitHub {
    owner = "orhnk";
    repo = "RASCII";
    rev = "v${version}";
    hash = "sha256-PXc5SGp82OC0QPAfOCQwaLyXYnjTlZgWSI7zx7/viHk=";
  };

  cargoHash = "sha256-QZ4Bk+6Fvfa28pnuBzQJg3z2iQDsLhgaNDADmVbphHo=";

  meta = {
    description = "Advanced image to ASCII art tool & crate written in Rust";
    homepage = "https://github.com/orhnk/RASCII";
    changelog = "https://github.com/orhnk/RASCII/releases/tag/${version}";
    license = with lib.licenses; [ mit ];
  };
}
