{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = with pkgs; [ grc ];

  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
  	  settings = {
        format = ''
        [](surface0)\
        $os\
        $username\
        $hostname\
        [ ](bg:surface0)\
        [](bg:peach fg:surface0)\
        $directory\
        [](fg:peach bg:green)\
        $git_branch\
        $git_status\
        [](fg:green bg:teal)\
        $c\
        $rust\
        $golang\
        $nodejs\
        $php\
        $java\
        $kotlin\
        $haskell\
        $python\
        $terraform\
        [](fg:teal bg:blue)\
        $docker_context\
        [](fg:blue bg:lavender)\
        $time\
        [ ](fg:lavender)\
        $line_break$character
        '';

        palette = "catppuccin_mocha";

        palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        orange = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
        };

        os = {
        disabled = false;
        style = "bg:surface0 fg:text";
        symbols = {
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
          };
        };

        username = {
          show_always = true;
          style_user = "bg:surface0 fg:text";
          style_root = "bg:surface0 fg:text";
          format = "[ \$user](\$style)";
        };

        hostname = {
          format = "[@\$hostname](\$style)";
          style = "bg:surface0 fg:text";
        };

        directory = {
        style = "fg:mantle bg:peach";
        format = "[ \$path ](\$style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          Documents = "󰈙 ";
          Downloads = " ";
          Music = "󰝚 ";
          Pictures = " ";
          Developer = "󰲋 ";
          };
        };

        git_branch = {
        symbol = "";
        style = "bg:teal";
        format = "[[ \$symbol \$branch ](fg:base bg:green)](\$style)";
        };

        git_status = {
        style = "bg:teal";
        format = "[[(\$all_status\$ahead_behind )](fg:base bg:green)](\$style)";
        };

        nodejs = {
        symbol = "";
        style = "bg:teal";
        format = "[[ \$symbol( \$version) ](fg:base bg:teal)](\$style)";
        };

        # Add similar blocks for other language modules
        c = {
        symbol = " ";
        style = "bg:teal";
        format = "[[ \$symbol( \$version) ](fg:base bg:teal)](\$style)";
        };

        rust = {
          symbol = "";
          style = "bg:teal";
          format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
        };
        golang = {
          symbol = "";
          style = "bg:teal";
          format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
        };
        php = {
          symbol = "";
          style = "bg:teal";
          format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
        };
        java = {
          symbol = " ";
          style = "bg:teal";
          format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
        };
        kotlin = {
          symbol = "";
          style = "bg:teal";
          format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
        };
        haskell = {
          symbol = "";
          style = "bg:teal";
          format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
        };
        python = {
          symbol = "";
          style = "bg:teal";
          format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
        };
        terraform = {
          symbol = "󱁢";
          style = "bg:teal";
          format = "[[ $symbol( $version) ](fg:base bg:teal)]($style)";
        };

        docker_context = {
          symbol = "";
          style = "bg:mantle";
          format = "[[ $symbol( $context) ](fg:#83a598 bg:color_bg3)]($style)";
        };

        time = {
          disabled = false;
          time_format = "%R";
          style = "bg:peach";
          format = "[[  \$time ](fg:mantle bg:lavender)](\$style)";
        };

        character = {
        disabled = false;
        success_symbol = "[](bold fg:green)";
        error_symbol = "[](bold fg:red)";
        vimcmd_symbol = "[](bold fg:creen)";
        vimcmd_replace_one_symbol = "[](bold fg:lavender)";
        vimcmd_replace_symbol = "[](bold fg:lavender)";
        vimcmd_visual_symbol = "[](bold fg:lavender)";
        };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
    };
    ripgrep = {
      enable = true;
    };
    bat = {
      enable = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # History configuration
    history = {
      size = 1000000;
      path = "~/.zsh_history";
      save = 1000000;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      share = true;
      append = true;
    };

    # Zsh options
    setOptions = [
      "AUTO_CD"
      "HIST_IGNORE_SPACE"
      "HIST_IGNORE_ALL_DUPS"
      "HIST_SAVE_NO_DUPS"
      "HIST_IGNORE_DUPS"
      "HIST_FIND_NO_DUPS"
      "APPEND_HISTORY"
      "SHARE_HISTORY"
    ];

    # Keybindings
    initExtra = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';

    # Completion styling and fzf-tab preview
    completionInit = ''
      autoload -Uz compinit && compinit
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza $realpath'
    '';

    # Aliases
    shellAliases = {
      ls = "eza --icons=always";
      lss = "eza";
      grep = "rg --color=auto";
      cat = "bat";
      vi = "nvim";
      vim = "nvim";
      c = "clear";
      python = "python3";
      update_fonts = "sudo fc-cache -fv";
    };

    # PATH modifications
    initExtra = ''
      # Add krew bin directory if it exists
      if [ -d "$HOME/.krew" ]; then
        PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
      fi

      # Add user's local bin if it exists
      if [ -d "$HOME/.local/bin" ]; then
        PATH="$HOME/.local/bin:$PATH"
      fi

      # Shell integrations
      if [[ -x "$(command -v fzf)" ]]; then
        source <(fzf --zsh)
      fi
      if [[ -x "$(command -v kubectl)" ]]; then
        source <(kubectl completion zsh)
      fi

      eval "$(zoxide init --cmd cd zsh)"
    '';

    # Plugin management using zplug (closest to Zinit in Home Manager)
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "Aloxaf/fzf-tab"; }
      ];
    };
    };
  };
}
