{
  nixConfig = {
    trusted-substituters = [
      "https://cachix.cachix.org"
      "https://nixpkgs.cachix.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };    
    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    auto-aspm = {
      url = "github:notthebee/AutoASPM";
      flake = false;
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    recyclarr-configs = {
      url = "github:recyclarr/config-templates";
      flake = false;
    };
    nix-colors.url = "github:misterio77/nix-colors";
    nur.url = "github:nix-community/NUR";
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-nix.url = "github:spikespaz/hyprland-nix";
    nwg-displays.url = "github:nwg-piotr/nwg-displays";
    deploy-rs.url = "github:serokell/deploy-rs";
    disko = {
      url = github:nix-community/disko/latest;
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    hydectl.url = "github:KillrOfLife/HyDE-cli-nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    { ... }@inputs:
    let
      helpers = import ./flakeHelpers.nix inputs;
      inherit (helpers) mkMerge mkNixos;
    in
    mkMerge [
      (mkNixos "framework" inputs.nixpkgs-unstable
        [
        #   ./desktop
          nixos-hardware.nixosModules.framework-amd-ai-300-series
          inputs.hyprland.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
        ]
      )
      (mkNixos "dell-steamos" inputs.nixpkgs-unstable
        [
        #   ./desktop
          inputs.jovian.nixosModules.default
          inputs.home-manager-unstable.nixosModules.home-manager
        ]
      )
      (mkNixos "dell-rice" inputs.nixpkgs-unstable
        [
        #   ./desktop
          inputs.hyprland.nixosModules.default
          inputs.home-manager-unstable.nixosModules.home-manager
        ]
      )
      (mkNixos "vm" inputs.nixpkgs
        [
        #   ./desktop
#         +      <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
# +      <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix>
          inputs.home-manager.nixosModules.home-manager
        ]
      )
    ];
}
