{
  pkgs,
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    ./config
    # ./gammastep.nix
    # ./kanshi.nix
    ./rofi.nix
    # ./swaync
    # ./swaylock.nix
    # ./theme
    # ./waybar
    # ./wlogout
    # ./xdg.nix

    # ../../programs/gui.nix

    # inputs.hyprland-nix.homeManagerModules.default
  ];
}