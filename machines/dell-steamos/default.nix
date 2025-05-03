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
    bluetooth.enable = lib.mkForce true;
    enableRedistributableFirmware = true;
    cpu.intel = {
      updateMicrocode = true;
      # ryzen-smu.enable = true;
    };
    nvidia.enabled = true;
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
    hostName = "dell";
  };

  jovian = {
    steam = {
      updater.splash = "steamos"; #"steamos", "jovian", "bgrt", "vendor"
      enable = true;
      autoStart = true;
      user = "arcana";
      desktopSession = "plasma";
    };
    steamos = {
      useSteamOSConfig = true;
      enableMesaPatches = true;
    };
  };

}