# ❄️ nix-config [![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

Based on [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs).


**Highlights:**
- An attempt of declaratively configuring KDE, including the desktop layout ([module](modules/home-manager/kde.nix), [usage](home/marcin/common/optional/desktop/kde.nix))

# Installation
```bash
nix-shell -p git
git clone https://github.com/taj-ny/nix-config
cd nix-config

export DISK=/dev/sda
export DISK_LAYOUT=disks/luks-btrfs-impermanence-swapfile.nix
export SWAPSIZE=16G
export CONFIGURATION=vm
sudo -E ./install.sh
```
You will be prompted for a root password. You can set it to anything, it's going to get deleted anyways because of impermanence. Root login is disabled by default.

After the system reboots, run:
```bash
cd /nix/config
nix develop
./deploy.sh -h
```

If using KDE, log out and log back in.

# Deployment
```bash
/nix/config/deploy.sh -hnu
```
- ``h`` - deploy home-manager configuration for the current user and host
- ``n`` - deploy nixos configuration for the current host
- ``u`` - update flake, exit if flake.lock doesn't change

# Gallery
![1](https://github.com/taj-ny/nix-config/assets/79316397/a74c6177-7abd-4df6-b882-ad19efe27f81)
![2](https://github.com/taj-ny/nix-config/assets/79316397/39bc1719-1aa0-4a2c-90aa-bca3eebc9c13)
![3](https://github.com/taj-ny/nix-config/assets/79316397/e97ab5cf-6d37-434e-8ae8-bfbdc69c534f)
