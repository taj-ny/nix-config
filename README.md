# ❄️ nix-config [![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

Based on [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs).


**Highlights:**
- An attempt of declaratively configuring KDE, including the desktop layout ([module](modules/home-manager/kde.nix), [usage](home/marcin/common/optional/desktop/kde.nix))
- Force blur on Wayland

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

# Security
### Configuration tampering
The configuration is stored at ``/nix/config`` and owned by the ``nixconfig`` user, under which neovim is launched. The ``.git`` folder and all scripts are owned by ``root``.

Deployments are done by the ``deploy.sh`` script, which copies ``/nix/config`` to ``/tmp/nix-config``, sets the ownership of all files to ``root`` and shows the diff (``git diff HEAD``). The user has a choice to either approve or reject the changes.

This approach prevents any malicious programs or neovim plugins from modifying the configuration without the user's knowledge.

# Screenshots
![1](https://github.com/taj-ny/nix-config/assets/79316397/a74c6177-7abd-4df6-b882-ad19efe27f81)
![2](https://github.com/taj-ny/nix-config/assets/79316397/39bc1719-1aa0-4a2c-90aa-bca3eebc9c13)
![3](https://github.com/taj-ny/nix-config/assets/79316397/2a292966-4d52-4514-8aaa-0619cedf5efb)

