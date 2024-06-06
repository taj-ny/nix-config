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
![1](https://github.com/taj-ny/nix-config/assets/79316397/bd833655-4f26-40df-b6b4-7cea704bd28c)
![2](https://github.com/taj-ny/nix-config/assets/79316397/6268f989-3657-4c24-9409-7377c7234528)
![3](https://github.com/taj-ny/nix-config/assets/79316397/3251da43-2c46-46be-b902-803de52bbf36)



