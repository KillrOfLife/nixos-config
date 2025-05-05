{ inputs, lib, config, pkgs, ... }:
{
  imports = [
    inputs.hyprland-nix.homeManagerModules.default

  ];
  home.packages = with pkgs; [
    xds-desktop-portal-hyprland
  ];
}
