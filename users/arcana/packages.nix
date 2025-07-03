{ pkgs, ...}: {
  home.packages = with pkgs; [
    zscroll
    pokemon-colorscripts-mac
    pokeget-rs
    nerd-fonts.iosevka
  ];
  fonts.fontconfig.enable = true;
}
