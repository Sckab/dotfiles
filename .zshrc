# ====== IMPORTANT ====== #
export NVM_DIR="$HOME/.nvm"
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.config/scripts:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$PATH:/home/giuliano/.local/bin"
export PATH="$HOME/Programmazione/Cpp/FIMA/build/:$PATH"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin/platform-tool:$PATH"
export PATH="$HOME/.local/share/coursier/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="/home/giuliano/.local/share/pnpm"

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# OMZ-PLUGINS
plugins=(
    git
    zsh-bat
    docker
    zsh-autosuggestions
    zsh-syntax-highlighting
    you-should-use
)

source $ZSH/oh-my-zsh.sh

# ====== EXPORTS ====== #
export EDITOR=nvim
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export XCURSOR_SIZE=24
export QT_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME=qt5ct

# ====== IMPORTS FROM OTHER FILES ====== #
source ~/.zsh/aliases-functions.zsh
source ~/.zsh/gemini-api-key.zsh

# ====== LOAD THINGS ====== #
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/green_black.omp.json)"
eval "$(zoxide init zsh)"

source <(ng completion script)

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "/home/giuliano/.bun/_bun" ] && source "/home/giuliano/.bun/_bun"
