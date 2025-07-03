{ pkgs, ...}: {
  home.packages = with pkgs; [
    # minecraft
    lunar-client
    prismlauncher
  ];
  # nixpkgs.config.allowBroken = true;
}
