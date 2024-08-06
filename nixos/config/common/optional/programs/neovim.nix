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

      cmp = {
        enable = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
        ];
      };

      lsp = {
        enable = true;

        servers.nil_ls.enable = true;
      };

      lualine = {
        enable = true;

        disabledFiletypes.statusline = [ "NvimTree" "toggleterm" "Trouble" ];
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

      telescope = {
        enable = true;

        keymaps = {
          "<C-F>".action = "find_files";
        };
      };

      trouble = {
        enable = true;

        settings.auto_open = true;         
      };
    };

    opts = {
      number = true;
    };
  };
}
