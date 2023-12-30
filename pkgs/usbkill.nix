{ lib, buildPythonPackage, fetchFromGitHub, usbutils }:

buildPythonPackage rec {
  pname = "usbkill";
  version = "1.0-rc.4";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "hephaest0s";
    repo = pname;
    rev = "d3df79edab0c1dcec4b56468958c17a5c5dc6dce";
    hash = "sha256-QIAC0Y0v3DXZVb8cjrMKZd1KW+9UHSC6MOeFc3jByAY=";
  };

  propagatedBuildInputs = [ usbutils ];

  prePatch = ''
    substituteInPlace usbkill/usbkill.py \
      --replace "\"lsusb\"" "\"${usbutils}/bin/lsusb\""
  '';

  meta = with lib; {
    description = "An anti-forensic kill-switch that waits for a change on your USB ports and then immediately shuts down your computer";
    homepage = "https://github.com/hephaest0s/usbkill";
    maintainers = [ "taj_ny" ];
  };
}
