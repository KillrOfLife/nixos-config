inputs:
let
  homeManagerCfg = userPackages: extraImports: {
    home-manager.useGlobalPkgs = false;
    home-manager.extraSpecialArgs = {
      inherit inputs;
    };
    home-manager.users.arcana.imports = [
      inputs.agenix.homeManagerModules.default
      inputs.nix-index-database.hmModules.nix-index
      ./users/arcana/dots.nix
    ] ++ extraImports;
    home-manager.backupFileExtension = "bak";
    home-manager.useUserPackages = userPackages;
  };
  vars = import ./machines/vars.nix;
in
{
  mkNixos = machineHostname: nixpkgsVersion: extraModules: rec {
    deploy.nodes.${machineHostname} = {
      hostname = machineHostname;
      profiles.system = {
        user = "root";
        sshUser = "arcana";
        path = inputs.deploy-rs.lib.x86_64-linux.activate.nixos nixosConfigurations.${machineHostname};
      };
    };
    nixosConfigurations.${machineHostname} = nixpkgsVersion.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        vars = import ./machines/vars.nix;
        inherit inputs;
      };
      modules = [
        inputs.disko.nixosModules.disko
        ./machines/_common
        ./machines/${machineHostname}
        ./users/arcana



        # ./modules/email
        # ./modules/tg-notify
        # ./modules/auto-aspm
        # ./modules/mover
        (homeManagerCfg false [ ])
      ] ++ extraModules;
    };
  };
  mkMerge = inputs.nixpkgs.lib.lists.foldl' (
    a: b: inputs.nixpkgs.lib.attrsets.recursiveUpdate a b
  ) { };
}
