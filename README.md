# ❄️ nix-config [![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

Based on [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs).

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

# Screenshots
![image](https://github.com/taj-ny/nix-config/assets/79316397/46712284-3a30-467d-b2fa-bd11bb3098b3)
![image](https://github.com/taj-ny/nix-config/assets/79316397/ed0c4193-148b-4999-ad68-6c6d00d01b86)
![image](https://github.com/taj-ny/nix-config/assets/79316397/5c769e65-6ae3-403e-94fd-6944b3327424)



