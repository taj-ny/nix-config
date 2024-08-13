{
  programs.btop.settings = {
    disks_filter = builtins.concatStringsSep " " [ "/" "/boot" "/nix" ];
    proc_sorting = "cpu direct";
    swap_disk = false;
    theme_background = false;
    update_ms = 1000;
  };
}
