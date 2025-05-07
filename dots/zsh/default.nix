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
        format = lib.concatStrings [
        ''[](surface0)''
        ''$os''
        ''$username''
        ''$hostname''
        ''[ ](bg:surface0)''
        ''[](bg:peach fg:surface0)''
        ''$directory''
        ''[](fg:peach bg:green)''
        ''$git_branch''
        ''$git_status''
        ''[](fg:green bg:teal)''
        ''$c''
        ''$rust''
        ''$golang''
        ''$nodejs''
        ''$php''
        ''$java''
        ''$kotlin''
        ''$haskell''
        ''$python''
        ''$terraform''
        ''[](fg:teal bg:blue)''
        ''$docker_context''
        ''[](fg:blue bg:lavender)''
        ''$time''
        ''[ ](fg:lavender)''
        ''$line_break$character''
        ];

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

    # PATH modifications
    initContent = ''
      
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Source/Load zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# Keybindings
# bindkey -e
# bindkey '^f' autosuggest-accept
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward
# bindkey '^[w' kill-region
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# History
HISTSIZE=1000000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ZSH options
# setopt correct
setopt auto_cd

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza $realpath'


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Check if mise is already installed
if [[ -x "$(command -v $HOME/.local/bin/mise)" ]]; then
  # Initialize mise 
  eval "$($HOME/.local/bin/mise activate zsh)"
else
  echo "mise (en place) not found. Installing..."
  curl https://mise.run | sh
  mise doctor && mise install
fi

# Check if starship is already installed
if [[ -x "$(command -v starship)" ]]; then
  # Initialize starship prompt if it's installed
  eval "$(starship init zsh)"
else
  echo "Starship prompt not found. Please fix mise config."
  # curl -sS https://starship.rs/install.sh | sh
fi

# Check if homebrew is already installed
if [ ! -d "/home/linuxbrew/.linuxbrew/bin" ] ; then
  echo "Homebrew not found. Installing..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
fi
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if [[ ! -x "$(command -v thefuck)" ]]; then
  echo "thefuck not found. Installing..."
  brew install thefuck
fi

# Add in snippets
# zinit snippet OMZL::git.zsh
# # zinit snippet OMZP::aliases
# zinit snippet OMZP::git
# zinit snippet OMZP::sudo
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
# zinit snippet OMZP::command-not-found

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# # Aliases
alias ls='eza --icons=always'
alias lss='eza'
alias grep='rg --color=auto'
alias cat='bat'
alias vi='nvim'
alias vim='nvim'
alias c='clear'
alias python='python3'


EDITOR='nvim'

function mise_pin() {
  mise use $1@$(mise latest $1)
}

alias mise_update='mise upgrade --bump'

# Shell integrations
if [[ -x "$(command -v fzf)" ]]; then; source <(fzf --zsh); fi
if [[ -x "$(command -v kubectl)" ]]; then; source <(kubectl completion zsh); fi

eval "$(zoxide init --cmd cd zsh)"
eval $(thefuck --alias)


    '';

    };
  };
}
