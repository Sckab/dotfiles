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
export PATH="$HOME/idea/bin:$PATH"
export PATH="/home/giuliano/.local/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="/home/giuliano/.local/share/pnpm"
export CMAKE_GENERATOR="Ninja"

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

# ====== IMPORTS FROM OTHER FILES ====== #
source ~/.zsh/aliases-functions.zsh
source ~/.zsh/gemini-api-key.zsh

# ====== LOAD THINGS ====== #
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/green_black.omp.json)"
eval "$(zoxide init zsh)"

source <(ng completion script)

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "/home/giuliano/.bun/_bun" ] && source "/home/giuliano/.bun/_bun"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select


# opencode completion
_opencode_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" opencode --get-yargs-completions "${words[@]}"))
  IFS=$si
  if [[ ${#reply} -gt 0 ]]; then
    _describe 'values' reply
  else
    _default
  fi
}
if [[ "'${zsh_eval_context[-1]}" == "loadautofunc" ]]; then
  _opencode_yargs_completions "$@"
else
  compdef _opencode_yargs_completions opencode
fi

# pnpm
export PNPM_HOME='/home/giuliano/.local/share/pnpm'
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
