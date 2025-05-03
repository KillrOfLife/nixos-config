{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # Official Nixpkgs extensions (add more if available in nixpkgs)
          # Otherwise, use `vscode-marketplace` below for all others
    vscode-marketplace."4ops".packer
    vscode-marketplace."aaron-bond".better-comments
    vscode-marketplace."akamud".vscode-theme-onedark
    vscode-marketplace."albert".tabout
    vscode-marketplace."alefragnani".project-manager
    vscode-marketplace."arrterian".nix-env-selector
    vscode-marketplace."bbenoist".nix
    vscode-marketplace."britesnow".vscode-toggle-quotes
    vscode-marketplace."catppuccin".catppuccin-vsc
    vscode-marketplace."catppuccin".catppuccin-vsc-icons
    vscode-marketplace."codezombiech".gitignore
    vscode-marketplace."davidanson".vscode-markdownlint
    vscode-marketplace."dev-kaustav".afterhours
    vscode-marketplace."docker".docker
    vscode-marketplace."dqisme".sync-scroll
    vscode-marketplace."editorconfig".editorconfig
    vscode-marketplace."fcrespo82".markdown-table-formatter
    vscode-marketplace."geekbinarynet".vscode-arubaos-config-syntax
    vscode-marketplace."github".copilot
    vscode-marketplace."github".copilot-chat
    vscode-marketplace."github".github-vscode-theme
    vscode-marketplace."github".vscode-github-actions
    vscode-marketplace."gitlab".gitlab-workflow
    vscode-marketplace."gruntfuggly".todo-tree
    vscode-marketplace."hashicorp".hcl
    vscode-marketplace."hashicorp".terraform
    vscode-marketplace."jnoortheen".nix-ide
    vscode-marketplace."mechatroner".rainbow-csv
    vscode-marketplace."meezilla".json
    vscode-marketplace."mhutchie".git-graph
    vscode-marketplace."michelemelluso".gitignore
    vscode-marketplace."mikestead".dotenv
    vscode-marketplace."mitchdenny".ecdc
    vscode-marketplace."mkhl".direnv
    vscode-marketplace."mohd-akram".vscode-html-format
    vscode-marketplace."ms-azuretools".vscode-docker
    vscode-marketplace."ms-kubernetes-tools".vscode-kubernetes-tools
    vscode-marketplace."ms-python".debugpy
    vscode-marketplace."ms-python".python
    vscode-marketplace."ms-python".vscode-pylance
    vscode-marketplace."ms-vscode-remote".remote-containers
    vscode-marketplace."ms-vscode-remote".remote-ssh
    vscode-marketplace."ms-vscode-remote".remote-ssh-edit
    vscode-marketplace."ms-vscode-remote".remote-wsl
    vscode-marketplace."ms-vscode-remote".vscode-remote-extensionpack
    vscode-marketplace."ms-vscode".cpptools
    vscode-marketplace."ms-vscode".makefile-tools
    vscode-marketplace."ms-vscode".powershell
    vscode-marketplace."ms-vscode".remote-explorer
    vscode-marketplace."ms-vscode".remote-server
    vscode-marketplace."owenfarrell".vscode-vault
    vscode-marketplace."p1c2u".docker-compose
    vscode-marketplace."peterjonsson".kickstart-language-support
    vscode-marketplace."pinage404".nix-extension-pack
    ];
    userSettings = {
      "editor.suggestSelection" = "first";
      "vsintellicode.modify.editor.suggestSelection" = "automaticallyOverrodeDefaultValue";
      "editor.fontFamily" = "MesloLGM Nerd Font Mono";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 17;
      "security.workspace.trust.untrustedFiles" = "open";
      "editor.guides.bracketPairs" = true;
      "terminal.integrated.fontFamily" = "MesloLGM Nerd Font Mono";
      "diffEditor.renderSideBySide" = false;
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.colorTheme" = "Catppuccin Mocha";
    };
  };
}