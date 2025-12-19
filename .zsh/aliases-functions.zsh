# ====== FUNCTIONS ====== #
function set_cursor_beam() {
    echo -ne '\e[6 q'
}

function ytmusic {
    yt-dlp -x --audio-format mp3 --audio-quality 0 \
        -o ~/Music/"%(title)s.%(ext)s" \
        --download-archive ~/yt-archive.txt "$1" && mpc update
}

function cr() {
    clear
    cd ~/"$1"
}

precmd_functions+=(set_cursor_beam)

# ====== ALIAS ====== #
# DIRECTORIES AND FILES
alias p='pwd'
alias c='clear'
alias ncd='ncdu'
alias r='ranger'
alias rm='rm -rfv'
alias ae="chmod +x"
alias ln='eza --icons'
alias cn='clear && nvim'
alias cl='clear && lazygit'
alias cne='clear && neofetch'
alias cff='clear && fastfetch'
alias grep='grep --color=auto'
alias cld='clear && lazydocker'
alias pj='. ~/.config/scripts/projects.sh'
alias ls='eza -lh --group-directories-first'
alias lsa='eza -alh --group-directories-first'
alias lna='eza -a --icons --group-directories-first'
alias tr="tree . -I 'node_modules|.next|.nuxt|dist|out|.cache|bin|obj|TestResults|__pycache__|venv|.idea|.vscode|.git' --dirsfirst -C"

# NVIM
alias n='nvim'
alias nv='NVIM_APPNAME=nvchad nvim'
alias nde='NVIM_APPNAME=nvim-nde nvim'
alias la='NVIM_APPNAME=nvim-lazyvim nvim'
alias nm='NVIM_APPNAME=nvim-minimal nvim'

# MUSIC
alias nc='mpd && ncmpcpp'

# GIT
alias l='lazygit'
alias ur='ga README.md && gc -m "update README" && gp'
alias gitcleanall='git fetch --prune && git remote prune origin && git gc --aggressive --prune=now'

# DEV
alias m="make"
alias py='python3'
alias car='cargo run'
alias Dr='dotnet run'
alias cab='cargo build'
alias cac='cargo check'
alias Drw='dotnet watch run'
alias sharp-console='dotnet new console -n'

# INTERNET
alias pin='ping 8.8.8.8'
alias gpi='gping 8.8.8.8'
alias mpi-google='mpi --host google.com --count 3 --timeout 1 --size 64'

# TMUX
alias e='exit'
alias t='tmux'
alias tk='tmux kill-server'

# AI
alias ai-chat='ollama run llama3:8b'
alias ai-code='ollama run deepseek-coder'

# UTILITY
alias i='imv'
alias please='sudo'
alias ra='yay -Rns'
alias my='shutdown now'
alias ib='imv -b 181616'
alias rp='sudo pacman -Rns'
alias zc='source ~/.zshrc && clear'
alias u="~/.config/scripts/utility.sh"
alias pi="~/.config/scripts/project-initter/main.sh"

# OTHERS
alias nf='neofetch'
alias ff='fastfetch'
alias pipes='pipes.sh -c2 -t1'
alias speedtest='speedtest-cli'
alias clock='tty-clock -c -C 2 -s -S'
alias stupiscimi='fortune | cowsay | lolcat'
alias sus='cat ~/.config/ascii_arts/among_us.txt'
alias kanagawa='~/.config/scripts/kanagawa_palette.sh'
alias susc='cat ~/.config/ascii_arts/among_us.txt | lolcat'
alias russian-roulette='.config/scripts/russian_roulette.sh'
