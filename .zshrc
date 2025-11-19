# ====== IMPORTANT ====== #
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/home/giuliano/.local/bin
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin/platform-tool:$PATH"
export PATH="$HOME/.config/scripts:$PATH"
export NVM_DIR="$HOME/.nvm"

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
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export QT_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME=qt5ct
export XCURSOR_SIZE=24
export TERM=kitty
export TERMINAL=kitty
export EDITOR=nvim
export BEMOJI_PICKER_CMD="rofi"
export BEMOJI_CLIP_CMD="wl-copy"

[ -f "/home/giuliano/.ghcup/env" ] && . "/home/giuliano/.ghcup/env" # ghcup-envexport PATH="$HOME/.ghcup/bin:$PATH"

# ====== IMPORTS FROM OTHER FILES ====== #
source ~/.zsh/aliases-functions.zsh

# ====== LOAD THINGS ====== #
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/green_black.omp.json)"
eval "$(zoxide init zsh)"

ZSH_THEME="robbyrussell"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
