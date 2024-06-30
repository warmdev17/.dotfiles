if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
set -U EDITOR vim
set -U SHELL fish
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -Ux HOMEBREW_NO_INSTALL_CLEANUP 1
set -Ux HOMEBREW_NO_ENV_HINTS 1
set -gx GTK_IM_MODULE ibus
set -gx QT_IM_MODULE ibus
set -gx XMODIFIERS @im=ibus
set -gx GLFW_IM_MODULE ibus
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

oh-my-posh init fish --config ~/catppuccin_mocha.omp.json | source
zoxide init fish | source


# alias
alias vim='nvim'
alias v='nvim'
alias npr='npm run dev'
alias pacman='sudo pacman'
alias reload='exec fish'
alias dev='cd ~/Workspace/'
alias home='cd ~'
alias rm='rm -rf'
alias ls='eza -a --icons'
alias ll='eza -al --icons'
# git alias
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash
        git pull"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"

alias shutdown='systemctl poweroff'

alias nc='cd ~/.config/nvim'
# brew
alias bi='brew install'
alias bu='brew upgrade'
alias bui='brew uninstall'
alias bri='brew reinstall'
function lt
    if test (pwd) = $HOME
        eza -a --icons --tree --level=1
    else
        eza -a --icons --tree
    end
end

# tmux quick sessions open
function ta
    tmux attach -t $argv
end

function tn
    tmux new -s $argv
end

function tl
    tmux ls
end

function tk
    tmux kill-session -t $argv
end



# g++ build
function build
    g++ -o $argv $argv.cpp && ./$argv
end

# java build and run
function jbr
    javac $argv[1] && java $argv[2]
end

# g++ build with lib
function buildwl
    g++ -o $argv[1] $argv[2] -l$argv[3] -l$argv[4] -l$argv[5] && ./$argv[1]
end

function yt-dl
    yt-dlp -f bestaudio --extract-audio --audio-format mp3 "$argv[1]"
end

function cd..
    for item in (seq $argv)
        cd ..
    end
end

# Created by `pipx` on 2024-04-15 12:20:04
set PATH $PATH /home/warmdev/.local/bin

# pip install
alias ppm='~/venv/bin/pip'

# Set up fzf key bindings
fzf --fish | source
function cdfzf
    set -l dir (find $argv[1] -type d 2> /dev/null | fzf)
    if test -n "$dir"
        cd "$dir"
    end
end
alias fb="fzf --preview 'bat --style=numbers --color=always {}'"
alias fbn="fzf --preview 'bat --style=numbers --color=always {}' | xargs -n 1 nvim"

bind \co accept-autosuggestion
bind \cq exit
bind \ce yy
bind \cl lazygit

function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function zox
    set dir (zoxide query -l | fzf --height 40% --reverse --ansi )
    if test -n "$dir"
        cd "$dir"
    end
end
