# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    inputs.nur.modules.homeManager.default
    # ./nvim.nix
    ./editors/vscode.nix
    ./editors/git.nix
    ./terminal
    ./apps/minecraft.nix
    ./apps/brave.nix
    ./apps/plex.nix
    # ./editors/nvim.nix

    # ./desktops/gnome
    ./desktops/hyprland
];
  config = {
    colorscheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  };
}
