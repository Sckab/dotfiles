# ====== FUNCTIONS ====== #
function set_cursor_block() {
    echo -ne '\e[2 q'
}

function set_cursor_beam() {
    echo -ne '\e[6 q'
}

function ytmusic {
    yt-dlp -x --audio-format mp3 --audio-quality 0 \
        -o ~/Music/"%(title)s.%(ext)s" \
        --download-archive ~/yt-archive.txt "$1" && mpc update
}

function reboot_fn {
    vared -p "Are you sure? (y/n) " -c VARIABLE

    case "$VARIABLE" in
        y)
            reboot
            ;;
        n)
        ;;
        *) echo "Please input only y or n"
        ;;
    esac
}

precmd_functions+=(set_cursor_beam)

# ====== ALIAS ====== #
alias ls='exa --icons'
alias lsa='exa -a --icons'
alias c='clear'
alias grep='grep --color=auto'
alias clock='tty-clock -c -C 2 -s -S'
alias nf='neofetch'
alias ff='fastfetch'
alias pipes='pipes.sh -c2 -t1'
alias exa='exa --icons'
alias speedtest='speedtest-cli'
alias stupiscimi='fortune | cowsay | lolcat'
alias u='yay -Syu'
alias rp='sudo pacman -Rns'
alias ra='yay -Rns'
alias sus='cat ~/.config/ascii_arts/among_us.txt'
alias susc='cat ~/.config/ascii_arts/among_us.txt | lolcat'
alias nivm='nvim'
alias sharp-console='dotnet new console -n'
alias zo='source ~/.zshrc'
alias n='nvim'
alias russian-roulette='.config/scripts/russian_roulette.sh'
alias t='tmux'
alias tk='tmux kill-server'
alias e='exit'
alias r='ranger'
alias l='lazygit'
alias giulsnet='sudo ~/.config/scripts/giulsnet.sh'
alias cr='clear && cd ~'
alias ncd='ncdu'
alias please='sudo'
alias ze='zellij'
alias kanagawa='~/.config/scripts/kanagawa_palette.sh'
alias py='python3'
alias pin='ping 8.8.8.8'
alias gpi='gping 8.8.8.8'
alias mpi='~/.config/scripts/megaping.py'
alias mpi-google='mpi --host google.com --count 3 --timeout 1 --size 64'
alias re='reboot_fn'
alias cn='clear && nvim'
alias ce='clear && exa'
alias cl='clear && lazygit'
alias cne='clear && neofetch'
alias cff='clear && fastfetch'
alias zc='source ~/.zshrc && clear'
alias ai-code='ollama run deepseek-coder'
alias ai-chat='ollama run llama3:8b'
alias cld='clear && lazydocker'
alias car='cargo run'
alias cac='cargo check'
alias cab='cargo build'
alias p='pwd'
alias gitcleanall='git fetch --prune && git remote prune origin && git gc --aggressive --prune=now'
alias my='shutdown now'
alias nc='mpd && ncmpcpp'
alias la='NVIM_APPNAME=nvim-lazyvim nvim'
alias nde='NVIM_APPNAME=nvim-nde nvim'
alias nv='NVIM_APPNAME=nvchad nvim'
alias Dr='dotnet run'
alias Drw='dotnet watch run'
alias pj='. ~/.config/scripts/projects.sh'
alias tr="tree . -I 'node_modules|.next|.nuxt|dist|out|.cache|bin|obj|TestResults|__pycache__|venv|.idea|.vscode|.git' --dirsfirst -C"
alias rm='rm -rfv'
alias isaac='/home/giuliano/.config/scripts/run_isaac.sh'
alias hypr='cd /home/giuliano/.config/hypr'
alias ur='ga README.md && gc -m "update README" && gp'
alias ib='imv -b 181616'
alias i='imv'
alias nm='NVIM_APPNAME=nvim-minimal nvim'
alias u="~/.config/scripts/utility.sh"
alias pi="~/.config/scripts/project-initter/main.sh"
