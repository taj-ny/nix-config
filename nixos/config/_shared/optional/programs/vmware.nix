{
  lib,
  pkgs,
  ...
}:

# License keys: https://gist.github.com/PurpleVibe32/30a802c3c8ec902e1487024cdea26251
let
  # The following crappy script improves VM performance by temporarily setting swappiness to 10 and disabling memory compaction.
  # TODO Don't set swappiness if already below 10
  # TODO Pkexec is covered by vmware's window
  launchScript = pkgs.writeShellScript "vmware.sh" ''
    if pgrep "vmware$" > /dev/null; then
        vmware
        exit 0
    fi

    SWAPPINESS=$(sysctl -n vm.swappiness)
    GTK_THEME=Adwaita:dark vmware & # TODO Breeze doesn't work for some reason
    pkexec /bin/sh -c "sysctl vm.compaction_proactiveness=0; sysctl vm.swappiness=10; while pgrep \"vmware$\" > /dev/null; do sleep .1; done; sysctl vm.swappiness=SWAPPINESS; sysctl vm.compaction_proactiveness=1"
  '';
in
{
  virtualisation.vmware.host = {
    enable = true;
    extraConfig = ''
      prefvmx.minVmMemPct = "100"
      MemTrimRate = "0"
      sched.mem.pshare.enable = "FALSE"
      prefvmx.useRecommendedLockedMemSize = "TRUE"
      mainmem.backing = "swap"
    '';
  };

  environment.systemPackages = with pkgs; [
    (patchDesktop vmware-workstation "vmware-workstation" "^Exec=${vmware-workstation}/bin/vmware" "Exec=${launchScript}")
  ];
}
