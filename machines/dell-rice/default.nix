{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  imports = [
    ./disko.nix
    ./boot.nix
    ../../modules/hyprland
    ../../modules/steam
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
    bluetooth = {
	    enable = true;
	    powerOnBoot = true;
	    settings = {
		    General = {
		      Enable = "Source,Sink,Media,Socket";
		      Experimental = true;
		    };
      };
    };
    enableRedistributableFirmware = true;
    cpu.intel = {
      updateMicrocode = true;
      # ryzen-smu.enable = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    # opengl.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };

  services = {
    openssh.enable = true;
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  networking = {
    networkmanager.enable = true;
    hostName = "dell";
  };
}
