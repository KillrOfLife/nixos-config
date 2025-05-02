{ inputs, lib, config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "KillrOfLife";
    userEmail = "74971817+KillrOfLife@users.noreply.github.com";

    extraConfig = {
      core = {
        sshCommand = "ssh -o 'IdentitiesOnly=yes' -i ~/.ssh/arcana";
      };
    };
  };
}
