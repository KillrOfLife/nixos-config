{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # Official Nixpkgs extensions (add more if available in nixpkgs)
      # Otherwise, use `vscode-marketplace` below for all others
      aaron-bond.better-comments
      arrterian.nix-env-selector
      bbenoist.nix
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      codezombiech.gitignore
      davidanson.vscode-markdownlint
      # dqisme.sync-scroll
      editorconfig.editorconfig
      github.copilot
      github.copilot-chat
      github.vscode-github-actions
      gruntfuggly.todo-tree
      hashicorp.hcl
      hashicorp.terraform
      jnoortheen.nix-ide
      mechatroner.rainbow-csv
      mhutchie.git-graph
      mikestead.dotenv
      mkhl.direnv
      ms-azuretools.vscode-docker
      ms-kubernetes-tools.vscode-kubernetes-tools
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      ms-vscode-remote.vscode-remote-extensionpack
      # ms-vscode.remote-explorer
      # ms-vscode.remote-server
      # owenfarrel.vscode-vault
      # p1c2u.docker-compose
      # peterjonsson.kickstart-language-support
      # pinage404.nix-extension-pack
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "packer";
        publisher = "4ops";
        version = "0.3.0";
        sha256 = "sha256-aYvTxdd+6ESSEDFtb8hwITVjLdbwTV5ZabpwAywGwVc=";
      }
    ];
    profiles.default.userSettings = {
      "editor.suggestSelection" = "first";
      "vsintellicode.modify.editor.suggestSelection" = "automaticallyOverrodeDefaultValue";
      "editor.fontFamily" = "Iosevka NF";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 17;
      "security.workspace.trust.untrustedFiles" = "open";
      "editor.guides.bracketPairs" = true;
      "terminal.integrated.fontFamily" = "Iosevka NF";
      "diffEditor.renderSideBySide" = false;
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.colorTheme" = "Catppuccin Mocha";
    };
    profiles.default.keybindings = [
      {
        key = "ctrl+d";
        command = "editor.action.duplicateSelection";
      }
    ];
  };
}
