{ inputs, pkgs, ... }:{
  environment.systemPackages = [inputs.suyu.packages.${pkgs.system}.suyu];
}