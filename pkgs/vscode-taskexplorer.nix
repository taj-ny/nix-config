{
  vscode-utils,
  ...
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "vscode-taskexplorer";
    publisher = "spmeesseman";
    version = "2.13.2";
    sha256 = "sha256-7Nk1rxtZMSVPTSRgD2bo0wXB2Vx/YtcZj+LcoDrVCkg=";
  };
}