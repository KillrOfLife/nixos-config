{ inputs, ... }:
let
  home = {
    username = "arcana";
    homeDirectory = "/home/arcana";
    stateVersion = "23.11";
  };
in
{

  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = home;

  imports = [
    inputs.nix-colors.homeManagerModule
    inputs.nur.hmModules.nur
    ../../dots/alacritty/default.nix
    ../../dots/zsh/default.nix
    ../../dots/nvim/default.nix
    ../../dots/neofetch/default.nix
    ../../dots/tmux/default.nix
    ../../dots/vscode/default.nix
    ../../dots/hyprland/default.nix
    ./packages.nix
    ./gitconfig.nix
  ];

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  colorscheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
