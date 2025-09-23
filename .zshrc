# ==============================================
# Zsh Configuration (by newuser for 5.9)
# ==============================================

# ---------- PATH & ENV ----------
export PATH="$HOME/.console-ninja/.bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"             # Load nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# ---------- Zinit ----------
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

# Download Zinit if not available
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source Zinit
source "${ZINIT_HOME}/zinit.zsh"

# ---------- Plugins ----------
zinit ice depth=1
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-history-substring-search

# ---------- Prompt ----------
eval "$(starship init zsh)"

# ---------- Aliases ----------
alias myip='curl https://ipinfo.io/ip'
alias greet='echo "Halo, $USER"'


# ---------- Completion Setup ----------
fpath=($fpath /usr/share/zsh/vendor-completions)
autoload -Uz compinit && compinit -i

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' case-sensitive false
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ---------- Search keybindings ----------
bindkey "$terminfo[kcuu1]" history-substring-search-up 
bindkey "$terminfo[kcud1]" history-substring-search-down 
bindkey '^[[A' history-substring-search-up 
bindkey '^[[B' history-substring-search-down

# ---------- History ----------
HISTSIZE=5000 
HISTFILE=~/.zsh_history 
SAVEHIST=$HISTSIZE 
HISTDUP=erase 
setopt appendhistory 
setopt sharehistory 
setopt hist_ignore_space 
setopt hist_ignore_all_dups 
setopt hist_save_no_dups 
setopt hist_ignore_dups 
setopt hist_find_no_dups 
setopt hist_expire_dups_first 
setopt extended_history

# ---------- Docker ----------
alias d='docker'
alias de='docker exec'
alias db='docker build'
alias dr='docker run'
alias dpsh='docker push'
alias dpl='docker pull'
alias dcu='docker compose up'
alias dcb='docker compose build'
alias dcd='docker compose down'
alias dcr='docker compose run'


# ---------- Aliases ----------
# File navigation
alias ls='ls --color'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'

# Tools
alias nano='nano'
alias c='clear'
alias grep='grep --color=auto'
alias g++='g++ -std=c++23 -pedantic'

