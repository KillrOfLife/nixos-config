{ inputs, ... }:
{
  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "arcana";
    homeDirectory = "/home/arcana";
    stateVersion = "23.11";
  };

  imports = [
    inputs.nix-colors.homeManagerModule
    # inputs.nur.modules.homeManager.default
    ../../home-manager/home.nix
    ./packages.nix
    ./gitconfig.nix
  ];

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.home-manager.enable = true;


}
