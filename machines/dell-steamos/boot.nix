{ lib, pkgs, ... }:
{
  console = {
    font = "ter-132n";
    packages = [ pkgs.terminus_font ];
    keyMap = "us";
  };

  # TTY
  fonts.fonts = [ pkgs.meslo-lgs-nf ];
  services.kmscon = {
    enable = true;
    hwRender = true;
    extraConfig = ''
      font-name=MesloLGS NF
      font-size=20
    '';
  };
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 0;
    initrd = { 
      verbose = false;
      availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    };
    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
    ];
    loader = {
      timeout = 10;
  	  efi.canTouchEfiVariables = true;
      # systemd-boot.enable = true;
      grub = {
            device = "nodev";
            efiSupport = true;
            enable = true;
            useOSProber = true;
            timeoutStyle = "menu";
      };
    };
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