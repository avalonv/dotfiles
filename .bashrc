# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILE=$HOME/.bash_history

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=-1

# emulate vi for inputting text
set -o vi

export PATH="$PATH:$HOME/scripts:$HOME/bin:$HOME/.local/bin:$HOME/.npm-global/bin"
export TERMINAL='kitty'

if nvim_path=$(which nvim); then
    export MANPAGER='nvim +Man!'
    export EDITOR="$nvim_path"
    export VISUAL="$nvim_path"
    alias vim='nvim'
else
    export EDITOR='vim'
    export VISUAL='vim'
fi

export RANGER_LOAD_DEFAULT_RC='FALSE'

# fixes kitty ls_colors, see https://github.com/kovidgoyal/kitty/issues/781
if [[ "$TERM" == "xterm-kitty" ]]; then
    export LS_COLORS='di=01;94:ln=01;96:pi=33:so=01;95:bd=01;93:cd=01;93:ex=01;92:do=01;95:su=37;41:sg=30;43:st=37;44:ow=34;42:tw=30;42:ca=30;41'
fi

# getting term colors:
# https://stackoverflow.com/a/28938235/8225672
# https://stackoverflow.com/questions/6403744/are-there-terminals-that-support-true-color#comment24567873_6486000

function copyq_copy
{
   local this="$@"

   copyq copy "$this"
}

alias copy='copyq_copy'

function dict_query
{ # colorit is part of the "m4" package
   local term="$@"

   dict -i wn "$term" | colorit | tail --lines=+50
}

alias dic='dict_query'

function random_color
{
    local prefix='\[\e[0;3'
    local suffix='m\]'
    local my_rand=$(( RANDOM % 16 ))
    if [[ "$my_rand" -gt 7 ]]; then
        prefix='\[\e[9'
        my_rand=$(( my_rand - 8 ))
    fi
    echo -E "${prefix}${my_rand}${suffix}"
}

function ytaudio()
{
    mpv --ytdl-format=bestaudio ytdl://ytsearch:“$*”
}

function set_prompt
{
    local last_exit=$?
    # local cool_ass_cat='~(=^⋅ω⋅^)'
    local cool_ass_cat='~'
    local begin='\[\e[m\]\[\e[1;90m\]'
    local user='\[\e[0;90m\]\u\[\e[m\]'
    local host='\[\e[m\]@\h'
    local bad='\[\e[0;94m\]'"${last_exit}\[\e[m\]"
    local time='(\A)'
    local dir='\[\e[m\]\[\e[0;93m\]\w\[\e[m\]'
    # local end="\n|$VIRTUAL_ENV $(random_color)¤\[\e[m\] "

    if [[ -z "$VIRTUAL_ENV" ]]; then
        local end="\n \[\e[1;94m\]¤\[\e[m\] "
    else
        local end="\n (venv) \[\e[1;94m\]¤\[\e[m\] "
    fi
    if [[ $(pwd) == "/home/$(id -nu ${UID})" ]]; then
        dir="\[\e[m\]\[\e[1;93m\]$cool_ass_cat\[\e[m\]"
    fi

    if [[ $last_exit = 0 ]]; then
        PS1="${begin}${user}${host}${dir}       ${end}"
    else
        PS1="${begin}${user}${host}${dir} ${bad}${end}"
    fi
}

abspath () {
    case "$1" in
        /*)printf "%s\n" "$1";;
        *)printf "%s\n" "$PWD/$1";;
    esac;
}

sedrename() {
# thankyouuuu https://stackoverflow.com/a/49215849/8225672
    if [ $# -gt 1 ]; then
        sed_pattern=$1
        shift
        for file in $(ls $@); do
            target="$(sed $sed_pattern <<< $file)"
            mkdir -p "$(dirname $(abspath $target))"
            mv -v "$file" "$target"
        done
    else
        echo "usage: $0 sed_pattern files..."
    fi
}

PROMPT_COMMAND='set_prompt'
# fucking SAVE THE HISTORY YOU COCKSUCKING RAT
PROMPT_COMMAND="$PROMPT_COMMAND;history -a"

# void specific
# alias xbps-update='xbps-install -Suy'
# alias xbps-search='xbps-query --regex -Rs'
# alias xbps-info='xbps-query -RS'
# alias xbps-deps='xbps-query -Rx'
# alias xbps-install='xbps-install -S'

# arch specific
# fix qt5 themes being wonky:
# https://bbs.archlinux.org/viewtopic.php?id=259721

# My scripts
alias gowifi='sudo sv reload wpa_supplicant'
alias goeth='sudo $HOME/scripts/connect_ethernet.sh'
alias scanip='$HOME/scripts/pingsweep.sh'
alias kyll='$HOME/scripts/kyll.sh'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='ls --color=auto '
alias ll='ls --color=auto -lah'
alias la='ls --color=auto -a'
alias l='ls --color=auto -CF'
alias lm='ls --color=auto -ltcAh'
alias lh='ls --color=auto --human-readable -sAh'
alias sudo='sudo '
alias trifle='rifle -f t '
alias mpc='ncmpcpp'
alias yget="youtube-dl -x --audio-format mp3"
# https://superuser.com/questions/927523/how-to-download-only-subtitles-of-videos-using-youtube-dl

alias rsync='rsync --progress'
alias rsync-dots='rsync -r --existing $HOME/ $HOME/Documents/dotfiles-default && cd $HOME/Documents/dotfiles-default && git status'
alias killjobs='kill $(jobs -p)'
alias term_colors='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done'
alias screenshot='maim -m 9 ~/Pictures/Screenshots/$(date +%F-%H%M%S)_maim.png'
alias myip="echo $(curl -s ipecho.net/plain)"
alias issh="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
alias gitls="git ls-tree -r master"
alias pyvenv="source ./venv/bin/activate"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
