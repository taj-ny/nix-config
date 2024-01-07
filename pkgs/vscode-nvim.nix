{ lib, buildVimPlugin, fetchFromGitHub }:

buildVimPlugin {
  pname = "vscode.nvim";
  version = "2023-12-20";

  src = fetchFromGitHub {
    owner = "Mofiqul";
    repo = "vscode.nvim";
    rev = "39841d05ab4a5c03ea0985196b9f3dfa48d83411";
    hash = "sha256-DnVDm0m3cvdPKZuCSRzBdHKgPXGB4X3nBsykFJjfzvY=";
  };

  meta = {
    description = "Neovim/Vim color scheme inspired by Dark+ and Light+ theme in Visual Studio Code";
    homepage = "https://github.com/Mofiqul/vscode.nvim";
    license = with lib.licenses; [ mit ];
  };
}
