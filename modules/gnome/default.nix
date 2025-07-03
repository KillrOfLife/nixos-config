{ inputs, lib, config, pkgs, ... }:
{
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    # wayland.enable = false;
    flatpak.enable = true;
  };

  programs.dconf.enable = true;


  environment.systemPackages = with pkgs; [
    # gnomeExtensions.blur-my-shell
    # gnomeExtensions.just-perfection
    # gnomeExtensions.arc-menu
    # adwaita-icon-theme
    # gnome-tweaks
    # adw-gtk3
    # adwaita-qt
    # papirus-icon-theme
    # papirus-folders
  ];
}
