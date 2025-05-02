{
  config,
  inputs,
  pkgs,
  ...
}:
{
  nix.settings.trusted-users = [ "arcana" ];

  users = {
    users = {
      arcana = {
        shell = pkgs.zsh;
        uid = 1000;
        isNormalUser = true;
        password = vars.arcana_password;
        extraGroups = [
          "wheel"
          "users"
          "video"
          "podman"
          "input"
        ];
        group = "arcana";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIArz9g4jw0M8BuBvqE2Pe4mCeIg81f2h4EIYV9181viG"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFHEPEcOFRQ8sSDMg2cBfsn/17fgPbDxMXKX92HGgkUG"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDbo0lC7EquAw4tv/slRqPZtTQp0iRvn6BUaCmyAuFhi"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHZNJmyezsHu8gQ3tLmJi7rbeYp/lQ4WfI80N8rOn96"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF7IdnIyfPwRx+3HMmKicHeaIdpawplTO8qhiBvVK/Qd"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAC2wfHFnKXwIUfI+gSEVILt/EIiSyemQYlfDa3C25dy"
        ];
      };
    };
    groups = {
      arcana = {
        gid = 1000;
      };
    };
  };
  programs.zsh.enable = true;

}
