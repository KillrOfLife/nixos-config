{ inputs, lib, config, pkgs, ... }:
{
  services.displayManager.defaultSession = "hyprland";

  programs = {
    hyprland = {
      enable = true;
      # nvidiaPatches = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };
    hyprlock.enable = true;
    # xwayland.enable = true;
    # dconf.enable = true;
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
    # WLR_DRM_DEVICES = "/dev/dri/card0:/dev/dri/card1"; # Explicitly set GPU devices
    # AQ_DRM_DEVICES = "/dev/dri/card0:/dev/dri/card1"; # Explicitly set GPU devices
 
  };

  # environment.variables = {
  #   LIBSEAT_BACKEND = "logind";
  # };

  environment.systemPackages = [
    pkgs.eww
    pkgs.dunst
    pkgs.libnotify
    pkgs.swww
    pkgs.rofi-wayland
  ];

  services.dbus.enable = true;

  # Extra Portal Configuration
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
      };
      initial_session = {
        command = "Hyprland";
        user = "arcana";
      };
    };
  };

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
