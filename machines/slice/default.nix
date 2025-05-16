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
    ../../modules/plasma
    # ../../modules/hyprland
    # ../../modules/steam
    # ../../modules/netbird
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
    cpu.intel = {
      updateMicrocode = true;
      # ryzen-smu.enable = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    # opengl.enable = true;
  };

  services = {
    openssh.enable = true;
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  networking = {
    networkmanager.enable = true;
    hostName = "slice";
  };

  

  environment.systemPackages = with pkgs; [
    s-tui
    stress
  
    envsubst
    pokemon-colorscripts-mac


    # --------------------------------------------------- // Applications
    firefox-bin                                                # browser
    alacritty                                                  # terminal
    unzip                                                  # extracting zip files
    neovim                                                    # terminal text editor
    # vscode                                                 # ide text editor (use 'vscode' or 'vscodium' instead of 'code')
    nwg-displays                                           # monitor management utility
    fzf                                                    # Command-line fuzzy finder

    # --------------------------------------------------- // Shell
    eza                                                    # file lister
    zsh                                                    # zsh shell
    starship                                               # customizable shell prompt written in Rust
    fastfetch                                              # system information fetch tool
    ripgrep
    zoxide
    bat
    stow

    # --------------------------------------------------- // Music
    cava                                                   # audio visualizer
    spotify                                                # proprietary music streaming service
    spicetify-cli                                          # cli to customize spotify client
  ];

}
