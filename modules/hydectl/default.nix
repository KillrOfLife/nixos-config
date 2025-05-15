{ inputs, pkgs, hydectl, ... }:{
environment.systemPackages = [inputs.hydectl.packages.${pkgs.system}.hydectl];

}
