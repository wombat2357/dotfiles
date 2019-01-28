#       ___           ___           ___           ___           ___           ___
#      /\  \         /\  \         /\  \         /\__\         /\  \         /\  \
#     /::\  \       /::\  \       /::\  \       /:/  /        /::\  \       /::\  \
#    /:/\:\  \     /:/\:\  \     /:/\ \  \     /:/__/        /:/\:\  \     /:/\:\  \
#   /::\~\:\__\   /::\~\:\  \   _\:\~\ \  \   /::\  \ ___   /::\~\:\  \   /:/  \:\  \
#  /:/\:\ \:|__| /:/\:\ \:\__\ /\ \:\ \ \__\ /:/\:\  /\__\ /:/\:\ \:\__\ /:/__/ \:\__\
#  \:\~\:\/:/  / \/__\:\/:/  / \:\ \:\ \/__/ \/__\:\/:/  / \/_|::\/:/  / \:\  \  \/__/
#   \:\ \::/  /       \::/  /   \:\ \:\__\        \::/  /     |:|::/  /   \:\  \
#    \:\/:/  /        /:/  /     \:\/:/  /        /:/  /      |:|\/__/     \:\  \
#     \::/__/        /:/  /       \::/  /        /:/  /       |:|  |        \:\__\
#      ~~            \/__/         \/__/         \/__/         \|__|         \/__/
#

# man bash
export MYHISTFILE=~/.bash_history
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
export HISTSIZE=50000
export HISTFILESIZE=50000

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

bash_alias() {
    # Easier navigation:
    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."
    alias .....="cd ../../../.."

    # Shortcuts
    alias dl="cd ~/Downloads"
    alias dt="cd ~/Desktop"
    alias pj="cd ~/projects"
    alias dtf="cd ~/mine/dotfiles"
    alias wrk="cd ~/workspace"
    alias g="git"

    # Detect which `ls` flavor is in use
    if ls --color > /dev/null 2>&1; then # GNU `ls`
        colorflag="--color"
        export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
    else # macOS `ls`
        colorflag="-G"
        export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
    fi

    # List all files colorized in long format
    alias l="ls -lF ${colorflag}"

    # List all files colorized in long format, excluding . and ..
    alias la="ls -lAF ${colorflag}"

    # List only directories
    alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

    # Always use color output for `ls`
    alias ls="command ls ${colorflag}"

    # Always enable colored `grep` output
    # Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    # Enable aliases to be sudo’ed
    alias sudo='sudo '

    # Reload the shell (i.e. invoke as a login shell)
    alias reload="exec ${SHELL} -l"

    # etc
    alias cp="cp -i"
    alias mv="mv -i"

    alias du='du -h'
    alias job='jobs -l'

    alias vi="vim"

    # Use plain vim.
    alias nvim='vim -N -u NONE -i NONE'

}
