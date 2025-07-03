{ lib, pkgs, ... }:
{
  console = {
    earlySetup = true;
    font = "ter-u28n";
    packages = [ pkgs.terminus_font ];
    keyMap = "us";
  };

  # TTY
  fonts = {
    enableDefaultPackages = false;
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.meslo-lg
    ];    
  };
  services.kmscon = {
    enable = true;
    hwRender = false;
    extraConfig = ''
      font-name=MesloLGM Nerd Font
      font-size=20
      no-drm
    ''; # disable drm for wayland

  };

  boot = {
    # kernelPackages = pkgs.linuxPackages_zen; # optimized for desktop environments
    kernelPackages = pkgs.linuxPackages_latest;
    # consoleLogLevel = 0;
    initrd.verbose = false;
    initrd.systemd.enable = true;
    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
      "amdgpu.sg_display=0"
    ];
    # Optionally, include xpadneo for better Xbox controller support:
    extraModulePackages = [ pkgs.linuxPackages_latest.xpadneo ];
    loader = {
      timeout = 10;
      efi.canTouchEfiVariables = true;
      # systemd-boot.enable = true;
      grub = {
            device = "nodev";
            efiSupport = true;
            enable = lib.mkForce true;
            useOSProber = true;
            timeoutStyle = "menu";
      };
    };
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "tcp_bbr" "kvm-intel" ];
    kernel.sysctl = {
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "fq";
      "net.core.wmem_max" = 1073741824;
      "net.core.rmem_max" = 1073741824;
      "net.ipv4.tcp_rmem" = "4096 87380 1073741824";
      "net.ipv4.tcp_wmem" = "4096 87380 1073741824";
    };
  };

}
