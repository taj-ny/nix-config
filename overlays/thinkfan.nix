prev: prev.thinkfan.overrideAttrs (old: rec {
  version = "2.0.0";
  src = prev.fetchFromGitHub {
    owner = "vmatare";
    repo = "thinkfan";
    rev = version;
    hash = "sha256-QqDWPOXy8E+TY5t0fFRAS8BGA7ZH90xecv5UsFfDssk=";
  };
  nativeBuildInputs = old.nativeBuildInputs ++ [ prev.lm_sensors ];
})