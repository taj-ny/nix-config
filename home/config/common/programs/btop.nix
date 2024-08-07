{
  programs.btop.settings = {
    disks_filter = builtins.concatStringsSep " " [ "/" "/boot" "/nix" ];
    swap_disk = false;
    update_ms = 1000;
  };
}
