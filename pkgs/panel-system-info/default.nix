{
  python312Packages
}:

python312Packages.buildPythonApplication rec {
  pname = "panel-system-info";
  version = "1.0.0";

  format = "other";
  dontUnpack = true;

  propagatedBuildInputs = builtins.attrValues {
    inherit (python312Packages) psutil;
  };

  installPhase = ''
  install -Dm755 ${./main.py} $out/bin/${pname}
  '';
}