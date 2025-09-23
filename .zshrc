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

