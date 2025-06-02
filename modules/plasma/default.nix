{ inputs, lib, config, pkgs, ... }:
{
  services = {
    desktopManager.plasma6.enable = true;
    xserver.desktopManager.plasma6.enable = true;
  };
}
