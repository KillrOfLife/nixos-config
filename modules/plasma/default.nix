{ inputs, lib, config, pkgs, ... }:
{
  services = {
    desktopManager.plasma6.enable = true;
  };
}
