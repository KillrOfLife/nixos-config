{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./disko.nix
    ./boot.nix
  ];

  environment.systemPackages = [
    pkgs.s-tui
    pkgs.stress
    pkgs.firefox-bin
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-partlabel/disk-main-root";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-partlabel/disk-main-ESP";
    fsType = "vfat";
  };

  hardware = {
    bluetooth.enable = lib.mkForce false;
    enableRedistributableFirmware = true;
    cpu.amd = {
      updateMicrocode = true;
      ryzen-smu.enable = true;
    };
    xone.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  services = {
    openssh.enable = true;
    desktopManager.plasma6.enable = true;
  };

  networking = {
    networkmanager.enable = true;
    hostName = "vm";
    hostId = "899635ed";
    interfaces.enp4s0.wakeOnLan = {
      enable = true;
    };
  };

}