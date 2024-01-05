{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.nixosModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    colorscheme = "vscode";
    extraPlugins = with pkgs; [ vscode-nvim ];

    plugins = {
      barbar.enable = true;
      nix.enable = true;
      toggleterm.enable = true;

      nvim-tree = {
        enable = true;
        openOnSetup = true;
        openOnSetupFile = true;

        actions.expandAll.exclude = [ ".git" ];
        view.width.min = 60;

        modified = {
          enable = true;
          showOnDirs = true;
        };
      };
    };

    options = {
      number = true;
    };
  };
}
