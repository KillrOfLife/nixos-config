# Nixos-config

## First Run

```sh
git-crypt init
git-crypt export-key ~/.ssh/git-crypt-nix

```


## Installation

Create a root password using the TTY

```bash
sudo su
passwd
```

From your host, copy the public SSH key to the server

```bash
export NIXOS_HOST=192.168.2.xxx
ssh-add ~/.ssh/arcana
ssh-copy-id -i ~/.ssh/arcana root@$NIXOS_HOST
```

SSH into the host with agent forwarding enabled (for the secrets repo access)

```bash
ssh -A root@$NIXOS_HOST
```

Enable flakes

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

Partition and mount the drives using [disko](https://github.com/nix-community/disko)

```bash
curl https://raw.githubusercontent.com/KillrOfLife/nixos-config/refs/heads/main/machines/vm/disko.nix \
    -o /tmp/disko.nix
nix --experimental-features "nix-command flakes" run github:nix-community/disko \
    -- -m destroy,format,mount /tmp/disko.nix
```

Install git and git-crypt

```bash
nix-env -f '<nixpkgs>' -iA git
nix-env -f '<nixpkgs>' -iA git-crypt
```

Clone this repository

```bash
mkdir -p /mnt/etc/nixos
git clone https://github.com/KillrOfLife/nixos-config.git /mnt/etc/nixos
```

Put the private and GPG key into place (required for secret management)

```bash
mkdir -p /mnt/home/arcana/.ssh
exit
scp ~/.ssh/arcana root@$NIXOS_HOST:/mnt/home/arcana/.ssh
scp ~/.ssh/git-crypt-nix root@$NIXOS_HOST:/mnt/home/arcana/.ssh
ssh root@$NIXOS_HOST
chmod 700 /mnt/home/arcana/.ssh
chmod 600 /mnt/home/arcana/.ssh/*
```

Unlock the git-crypt vault

```bash
cd /mnt/etc/nixos
chown -R root:root .
git-crypt unlock /mnt/home/arcana/.ssh/git-crypt-nix
```

Install the system

```bash
nixos-install \
--root "/mnt" \
--no-root-passwd \
--flake "git+file:///mnt/etc/nixos#vm" # alison, emily, etc.
```

Unmount the filesystems

```bash
umount "/mnt/boot/efis/*"
umount -Rl "/mnt"
zpool export -a
```

Reboot

```bash
reboot
```