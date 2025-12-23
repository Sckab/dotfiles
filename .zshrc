# ====== IMPORTANT ====== #
export NVM_DIR="$HOME/.nvm"
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.config/scripts:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$PATH:/home/giuliano/.local/bin"
export PATH="$HOME/Programmazione/Cpp/FIMA/build/:$PATH"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin/platform-tool:$PATH"
export PATH="$HOME/.local/share/coursier/bin:$PATH"

# OMZ-PLUGINS
source ~/.zsh/gemini-api-key.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

plugins=(
    git
    zsh-bat
    docker
)

source $ZSH/oh-my-zsh.sh

# ====== EXPORTS ====== #
export EDITOR=nvim
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export XCURSOR_SIZE=24
export QT_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME=qt5ct

[ -f "/home/giuliano/.ghcup/env" ] && . "/home/giuliano/.ghcup/env" # ghcup-envexport PATH="$HOME/.ghcup/bin:$PATH"

# ====== IMPORTS FROM OTHER FILES ====== #
source ~/.zsh/aliases-functions.zsh

# ====== LOAD THINGS ====== #
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/green_black.omp.json)"
eval "$(zoxide init zsh)"

ZSH_THEME="robbyrussell"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
