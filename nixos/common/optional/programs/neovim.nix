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
      lsp-lines.enable = true;
      nix.enable = true;
      toggleterm.enable = true;

      lsp = {
        enable = true;

        servers.nil_ls.enable = true;
      };

      lualine = {
        enable = true;

        disabledFiletypes.statusline = [ "NvimTree" "toggleterm" "Trouble" ];
      };

      nvim-cmp = {
        enable = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
        ];
      };

      nvim-tree = {
        enable = true;
        openOnSetup = true;
        openOnSetupFile = true;

        modified = {
          enable = true;
          showOnDirs = true;
        };

        actions.expandAll.exclude = [ ".git" ];

        view.width = {
          min = 30;
          max = 60;
        };
      };

      trouble = {
        enable = true;
        autoOpen = true;
        autoClose = true;
      };
    };

    options = {
      number = true;
    };
  };
}
