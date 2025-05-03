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
      (nerdfonts.override {fonts = ["Meslo" "FiraCode" "SourceCodePro" "UbuntuMono"];})
      meslo-lgs-nf
      font-awesome
      fira-code
      fira-code-symbols
      fira-code-nerdfont
    ];
  };
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
    # consoleLogLevel = 0;
    initrd.verbose = false;
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
      systemd-boot.enable = true;
    };
    kernelModules = [ "tcp_bbr" ];
  };

}