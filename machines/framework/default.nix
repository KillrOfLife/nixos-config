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
    # ./framework_patches.nix
    ../../modules/plasma
    ../../modules/steam
    ../../modules/netbird
    # ../../modules/hydectl
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
    # cpu.intel = {
    #   updateMicrocode = true;
    #   # ryzen-smu.enable = true;
    # };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    # opengl.enable = true;
    # nvidia = {
    #   modesetting.enable = true;
    #   powerManagement.enable = true;
    # };
  };

  services = {
    openssh.enable = true;
    blueman.enable = true;

    fstrim.enable = lib.mkDefault true; # enable fstrim for SSDs
  };

  networking = {
    networkmanager.enable = true;
    hostName = "Sylveon";
  };

  environment.systemPackages = with pkgs; [
    s-tui
    stress
    firefox-bin
    stow
    neovim
    
    ripgrep
    zoxide
    bat

    # envsubst
    pokemon-colorscripts-mac

    gnumake
    # # --------------------------------------------------- // System
    # brightnessctl                                          # screen brightness control
    # udiskie                                                # manage removable media
    # ddcui                                                  # GUI to control brightness for external monitors

    # # --------------------------------------------------- // Display Manager
    # kdePackages.sddm                                                   # display manager for KDE plasma
    # libsForQt5.qt5.qtquickcontrols                                      # for sddm theme ui elements
    # libsForQt5.qt5.qtquickcontrols2                                     # for sddm theme ui elements
    # libsForQt5.qt5.qtgraphicaleffects                                   # for sddm theme effects

    # # --------------------------------------------------- // Window Manager
    # # hyprland                                               # wlroots-based wayland compositor
    # dunst                                                  # notification daemon
    # rofi-wayland                                           # application launcher
    # waybar                                                 # system bar
    # # swww                                                   # wallpaper
    # # hyprlock                                               # lock screen
    # # wlogout                                                # logout menu
    # # grim                                                   # screenshot tool
    # # hyprpicker                                             # color picker
    # # slurp                                                  # region select for screenshot/screenshare
    # # satty                                                  # Modern Screenshot Annotation
    # # cliphist                                               # clipboard manager
    # # hyprsunset                                             # blue light filter

    # # --------------------------------------------------- // Dependencies
    # # polkit_gnome                                           # authentication agent (note: underscore in Nixpkgs)
    # # xdg-desktop-portal-hyprland                            # xdg desktop portal for hyprland
    # # xdg-desktop-portal-gtk                                 # file picker and dbus  integration
    # # xdg-user-dirs                                          # Manage user directories like ~/Desktop and ~/Music
    # # # pacman-contrib                                         # for system update check
    # # parallel                                               # for parallel processing
    # jq                                                     # for json processing
    # yq
    # # imagemagick                                            # for image processing
    # # libsForQt5.qt5.qtimageformats                                       # for dolphin image thumbnails
    # # libsForQt5.ffmpegthumbs                                           # for dolphin video thumbnails
    # # kdePackages.kde-cli-tools                                          # for dolphin file type defaults
    # # libnotify                                              # for notifications
    # # noto-fonts-emoji                                       # emoji font

    # # --------------------------------------------------- // Theming
    # # nwg-look                                               # gtk configuration tool
    # # libsForQt5.qt5ct                                                  # qt5 configuration tool
    # # kdePackages.qt6ct                                                  # qt6 configuration tool
    # # kvantum                                                # svg based qt6 theme engine
    # # kvantum-qt5                                            # svg based qt5 theme engine
    # # qt5-wayland                                            # wayland support in qt5
    # # qt6-wayland                                            # wayland support in qt6

    # # --------------------------------------------------- // Applications
    # # firefox                                                # browser
    # alacritty                                                  # terminal
    # # kdePackages.dolphin                                                # kde file manager
    # # kdePackages.ark                                                    # kde file archiver
    # unzip                                                  # extracting zip files
    # # vim                                                    # terminal text editor
    # # vscode                                                 # ide text editor (use 'vscode' or 'vscodium' instead of 'code')
    # # nwg-displays                                           # monitor management utility

    # # --------------------------------------------------- // Shell
    # eza                                                    # file lister
    # zsh                                                    # zsh shell
    # starship                                               # customizable shell prompt written in Rust
    # fastfetch                                              # system information fetch tool
    # fzf                                                    # Command-line fuzzy finder

    # # --------------------------------------------------- // HyDE
    # # hypridle                                               # idle daemon

    # # --------------------------------------------------- // Music
    # cava                                                   # audio visualizer
    # spotify                                                # proprietary music streaming service
    # spicetify-cli                                          # cli to customize spotify client
  ];
}
