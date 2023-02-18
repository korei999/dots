# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#setopt correct            # auto correct mistakes
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/korei/.zshrc'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi


alias xgif="byzanz-record --height=1080 --width=1920"
alias g="gcc -Wall -g -pedantic -o"
alias gpp="g++ -Wall -g -pedantic -o"
alias cl="clang -Wall -g -pedantic -o"
alias clpp="clang++ -Wall -g -pedantic -o"
alias t="tcc -Wall -g -o"
alias wgif="wf-recorder -g \"\$(slurp)\" -F fps=30 -c gif -f"
alias wprop="sleep 2; sway-prop"
alias rm="gio trash"
alias lsf="find . -maxdepth 1 -type f"
alias resume="fg"
alias kt="pkill -f tmux"
alias btt="bluetooth toggle"
alias fnt="foot --log-level none & disown"
alias fixsnd="systemctl --type=service restart alsa-restore.service"
alias wttr="curl wttr.in"

function cd {
    builtin cd "$@" && ls -a -F
    }

bindkey "^[[1~"   beginning-of-line
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey "^[[4~"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey '^[^?' backward-kill-word
bindkey '^[[Z' reverse-menu-complete

setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# foot
autoload -U add-zsh-hook
function osc7 {
    local LC_ALL=C
    export LC_ALL

    setopt localoptions extendedglob
    input=( ${(s::)PWD} )
    uri=${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-\/])/%${(l:2::0:)$(([##16]#match))}}
    print -n "\e]7;file://${HOSTNAME}${uri}\e\\"
}
add-zsh-hook -Uz chpwd osc7

n ()
{
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    \nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# nnn stuff
export NNN_OPTS="HdA"
export NNN_PLUG='p:preview-tui;d:dragdrop;i:imgview;u:mypreview'
export NNN_BMS="c:$HOME/.config/;h:$HOME/;l:$HOME/.local/;t:$HOME/.local/share/Trash/files/;p:$HOME/Pictures/;s:$HOME/Pictures/Screens/;m:/run/media/$USER"

# prompt stuff
fpath+=($HOME/source/pure)
autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=3
zstyle :prompt:pure:prompt:success color cyan
# turn on git stash status
zstyle :prompt:pure:git:stash show yes
PURE_PROMPT_SYMBOL="%%"
PURE_PROMPT_VICMD_SYMBOL="%%"

prompt pure

fastfetch
