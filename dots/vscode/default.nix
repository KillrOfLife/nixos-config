{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
    # Official Nixpkgs extensions (add more if available in nixpkgs)
    # Otherwise, use `vscode-marketplace` below for all others
    4ops.packer
    aaron-bond.better-comments
    akamud.vscode-theme-onedark
    albert.tabout
    alefragnani.project-manager
    arrterian.nix-env-selector
    bbenoist.nix
    britesnow.vscode-toggle-quotes
    catppuccin.catppuccin-vsc
    catppuccin.catppuccin-vsc-icons
    codezombiech.gitignore
    davidanson.vscode-markdownlint
    docker.docker
    dqisme.sync-scroll
    editorconfig.editorconfig
    fcrespo82.markdown-table-formatter
    geekbinarynet.vscode-arubaos-config-syntax
    github.copilot
    github.copilot-chat
    github.vscode-github-actions
    gruntfuggly.todo-tree
    hashicorp.hcl
    hashicorp.terraform
    jnoortheen.nix-ide
    mechatroner.rainbow-csv
    meezilla.json
    mhutchie.git-graph
    michelemelluso.gitignore
    mikestead.dotenv
    mitchdenny.ecdc
    mkhl.direnv
    mohd-akram.vscode-html-format
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools
    ms-vscode-remote.remote-containers
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-ssh-edit
    ms-vscode-remote.vscode-remote-extensionpack
    ms-vscode.remote-explorer
    ms-vscode.remote-server
    owenfarrel.vscode-vault
    p1c2u.docker-compose
    peterjonsson.kickstart-language-support
    pinage404.nix-extension-pack
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
}