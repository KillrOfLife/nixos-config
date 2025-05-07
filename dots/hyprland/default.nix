{
  pkgs,
  config,
  inputs,
  lib,
  ...
}:{
  imports = [
    ./config
    ./gammastep.nix
    ./kanshi.nix
    ./rofi.nix
    ./swaync
    ./swaylock.nix
    ./theme
    ./waybar
    ./wlogout
    ./xdg.nix


    inputs.hyprland-nix.homeManagerModules.default
  ];

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
      QT_QPA_PLATFORM = "wayland;xcb";
      LIBSEAT_BACKEND = "logind";
    };

    dconf.settings = {
      "org/gnome/desktop/privacy" = {
        remember-recent-files = false;
      };
    };

    home.packages = with pkgs; [
      mplayer
      mtpfs
      jmtpfs
      brightnessctl
      xdg-utils
      wl-clipboard
      pamixer
      playerctl

      inputs.nwg-displays.packages.${pkgs.system}.default
      grimblast
      slurp
      sway-contrib.grimshot
      pkgs.xdg-desktop-portal-hyprland
      pkgs.satty

    kooha
    mission-center
    foliate
    helvum
    pavucontrol
    pika-backup
    read-it-later
    trayscale
    piper

    fragments
    baobab
    thunderbird
    gnome-power-manager
    sushi
    gnome-disk-utility
    totem
    gvfs
    loupe
    gnome-text-editor
    gnome-network-displays
    gnome-firmware
    swaybg
    nautilus
    ffmpegthumbnailer # thumbnails
    nautilus-python # enable plugins
    gst_all_1.gst-libav # thumbnails
    nautilus-open-any-terminal # terminal-context-entry
  ];

  home.sessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0 = lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" (with pkgs.gst_all_1; [
    gst-plugins-good
    gst-plugins-bad
    gst-plugins-ugly
    gst-libav
  ]);

  xdg.configFile."com.github.johnfactotum.Foliate/themes/mocha.json".text = ''
    {
        "label": "Mocha",
        "light": {
        	"fg": "#999999",
        	"bg": "#cccccc",
        	"link": "#666666"
        },
        "dark": {
        	"fg": "#cdd6f4",
        	"bg": "#1e1e2e",
        	"link": "#E0DCF5"
        }
    }
  '';
}
