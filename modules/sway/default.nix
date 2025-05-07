{ inputs, lib, config, pkgs, ... }:
{
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };


  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
  ];

  services.dbus.enable = true;



  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
