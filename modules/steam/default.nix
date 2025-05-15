{ inputs, lib, config, pkgs, ... }:
{
    programs = {
        steam.enable = true;
    };

    environment.systemPackages = with pkgs; [
        mangohud
        gamemode
    ];
}