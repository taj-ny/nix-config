# ❄️ nix-config [![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

Based on [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs).


**Highlights:**
- An attempt of declaratively configuring KDE, including the desktop layout ([module](modules/home-manager/kde.nix), [usage](home/marcin/common/optional/desktop/kde.nix))

# Installation
### 1. Clone the repository
```bash
nix-shell -p git
git clone https://github.com/taj-ny/nix-config
cd nix-config
```

### 2. Partition the drive
```bash
sudo nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko disks/luks-btrfs-impermanence-swapfile.nix --arg disks '[ "/dev/sda" ]'
```

### 3. Copy the configuration to a persistent path
```bash
cd ..
sudo chown -R root:root nix-config
sudo chmod -R 755 nix-config
sudo mv nix-config /mnt/nix/config
cd /mnt/nix/config
```

### 4. Create swapfile
```bash
sudo btrfs filesystem mkswapfile --size 16G /mnt/swap/swapfile
sudo swapon /mnt/swap/swapfile
```

### 5. Set password
```bash
sudo mkdir /mnt/persist/passwords
sudo chmod 700 /mnt/persist/passwords
mkpasswd -m sha-512 | sudo tee /mnt/persist/passwords/marcin
```

### 6. Install NixOS
```bash
sudo nixos-install --flake .#vm
sudo reboot
```

TODO hardware configuration, home-manager


# Gallery
![1](https://github.com/taj-ny/nix-config/assets/79316397/a74c6177-7abd-4df6-b882-ad19efe27f81)
![2](https://github.com/taj-ny/nix-config/assets/79316397/39bc1719-1aa0-4a2c-90aa-bca3eebc9c13)
![3](https://github.com/taj-ny/nix-config/assets/79316397/e97ab5cf-6d37-434e-8ae8-bfbdc69c534f)
