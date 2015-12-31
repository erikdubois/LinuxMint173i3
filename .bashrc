# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

## enable color support of ls and also add handy aliases

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=always'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#-----------------------------------------------------------------------------
# Environment Variables
#-----------------------------------------------------------------------------
# Security: close root shells after n seconds of inactivity
[ "$UID" = 0 ] && export TMOUT=180

# User's full name
MY_F_NAME=$(grep ${UID} /etc/passwd | cut -d ":" -f5 | sed 's/\,//g')

# PATH addons
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
#if [ "$UID" != 0 ]; then
#    PATH="$PATH:/usr/local/bin:/usr/sbin:/sbin:/usr/local/sbin"
#fi
[ -d "/opt/bitnami" ] && PATH="/opt/bitnami/php/bin:/opt/bitnami/mysql/bin:/opt/bitnami/apache2/bin:/opt/bitnami/common/bin:$PATH"
export PATH

# Pager and Editor
export PAGER="/usr/bin/less"
export EDITOR="/usr/bin/vi"
export VISUAL="${EDITOR:-/usr/bin/vi}"
if [ "$UID" != 0 ]; then
    export XPAGER=$PAGER
    export XEDITOR="jedit"
fi

# Set options for less
export LESS="-MJWi --tabs=4 --shift 5"
export LESSHISTFILE="-"     # no less history file
alias less="less -R"

if [ "$UID" != 0 ]; then
    export LESSCHARSET="utf-8"
    if [ -z "$LESSOPEN" ]; then
        if [ "$__distribution" = "Debian" ]; then
            [ -x "`which lesspipe`" ] && eval "$(lesspipe)"
        else
            [ -x "`which lesspipe.sh`" ] && export LESSOPEN="|lesspipe.sh %s"
        fi
    fi
    # Yep, 'less' can colorize manpages
    export LESS_TERMCAP_mb=$'\E[01;31m'
    export LESS_TERMCAP_md=$'\E[01;31m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_se=$'\E[0m'
    export LESS_TERMCAP_so=$'\E[01;44;33m'
    export LESS_TERMCAP_ue=$'\E[0m'
    export LESS_TERMCAP_us=$'\E[01;32m'
fi

## dotfiles path
MYDOTFILES="${HOME}/.profile.d/dotfiles"

# Screenrc environment
export SCREENRC="${MYDOTFILES}/screenrc"

# Bash History
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTFILE="$HOME/.bash_history_${HOSTNAME}"
if [ "$UID" != 0 ]; then
    export HISTCONTROL="ignoreboth"   # ignores duplicate lines next to each other and lines with a leading space
    export HISTIGNORE="[bf]g:exit:logout"
fi

#-----------------------------------------------------------------------------
# shopt options
#-----------------------------------------------------------------------------
# If set, minor errors in the spelling of a directory component in a cd 
# command will be corrected.
shopt -s cdspell 

# If set, Bash checks the window size after each command and, if
# necessary, updates the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, and Readline is being used, Bash will not attempt to search the 
# PATH for possible completions when completion is attempted on 
# an empty line.
shopt -s no_empty_cmd_completion

# If set, a command name that is the name of a directory is executed
# as if it were the argument to the cd command. This option is only
# used by interactive shells.
shopt -s autocd

# If set, Bash includes filenames beginning with a ‘.’ in the results of
# filename expansion.
shopt -s dotglob

# If set, the history list is appended to the file named by the value of
# the HISTFILE variable when the shell exits, rather than overwriting
# the file.
shopt -s histappend

# If set, Bash attempts to save all lines of a multiple-line command
# in the same history entry. This allows easy re-editing of multi-line
# commands.
shopt -s cmdhist

#-----------------------------------------------------------------------------
# Check for 256-color terminal and export TERM
#-----------------------------------------------------------------------------

# If xterm-256color does not exist, export TERM=xterm-color
[ ! -f /lib/terminfo/x/xterm-256color ] && export TERM=xterm-color || export TERM=xterm-256color

# Evaluate color capabilties and source ~/.dircolors if it exists

if [ -x $(which dircolors) ]; then	# If dircolors program is available evaluate colors
	if [ -s "$HOME/.dircolors" ]; then
   		eval "`dircolors -b $HOME/.dircolors`"
				else
    		eval "`dircolors -b`"
	fi
fi

# ls and grep default options
if [ ${TERM} = xterm-color -o ${TERM} = xterm-256color ]; then
	GREP_OPTIONS="--directories=recurse --ignore-case"
	GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=01;32:ln=32:bn=32:se=36" # Filename -fn, Non-matched text -sl
	LS_OPTIONS="-hFN --color=auto"
fi

#GREP_OPTIONS="-r -E --color=always"
if [ ${TERM} = xterm-color -o ${TERM} = xterm-256color -a "$UID" = 0 ]; then
    LS_OPTIONS="-hfN --color=auto"
    GREP_OPTIONS=""
    alias ls='ls ${LS_OPTIONS}'
fi

export LS_OPTIONS GREP_OPTIONS GREP_COLORS

[ -n "$PS1" ] && bind "set completion-ignore-case on"

export RSYNC_RSH="ssh"
alias rsync='rsync -v --progress --partial'

#-----------------------------------------------------------------------------
# Begin Prompt section
#-----------------------------------------------------------------------------
export GT_RESET="$(tput sgr0)"      # Reset all attributes
export GT_BRIGHT="$(tput bold)"     # Set "bright" attribute
export GT_DIM="$(tput dim)"         # Set "dim" attribute
export PALE_ROSE="$(tput setaf 173)"
export BRIGHT_BLUE="$(tput setaf 39)"
export PALE_BLUE="$(tput setaf 153)"
export BRIGHT_YELLOW="$(tput setaf 220)"
export PALE_GREEN="$(tput setaf 156)"
export SOFT_PINK="$(tput setaf 167)"
export BRIGHT_RED="$(tput setaf 196)"

# Stores the exit status of the last command for use by show_exit_status function.
if [[ ! $PROMPT_COMMAND =~ store_exit_status ]]; then
  export PROMPT_COMMAND="store_exit_status && ${PROMPT_COMMAND:-:}"
fi

store_exit_status() {
  LAST_EXIT_STATUS=$?
}

show_time() {
  echo "${PALE_BLUE}[$(date +%H:%M)]${GT_RESET}"
}

show_exit_status() {
  if [ "x${LAST_EXIT_STATUS}" != "x0" ]; then
    echo "${GT_BRIGHT}${SOFT_PINK}[${LAST_EXIT_STATUS}]${GT_RESET}"
  fi
}

prompt_color() {

if [[ -z "$SSH_CLIENT" && "${UID}" -ne "0" ]]; then
        echo "${GT_BRIGHT}${PALE_GREEN}"
    elif [ "${UID}" -eq "0" ]; then
        echo "${GT_BRIGHT}${BRIGHT_RED}"
    else
        echo "${GT_BRIGHT}${BRIGHT_YELLOW}"
fi
}

prompt_symbol() {
if [ "${UID}" -eq "0" ]; then
        printf "[root]⌘"
    else
        printf "⌘"
fi

}
#-----------------------------------------------------------------------------
# Prompts - defined colors below
#-----------------------------------------------------------------------------
set_prompts() {

# Define prompt based on whether I am local or connected via ssh

        PS1='$(show_time) $(prompt_color)'"\h${COLOR_NONE}:${BRIGHT_BLUE}\w${GT_RESET}"' $(show_exit_status)'"${GT_RESET}\n$(prompt_symbol) "
   
        PS2="${BRIGHT_BLUE}>${DEFAULT} "
        PS3=$PS2
        PS4="${BRIGHT_RED}+${DEFAULT} "

    # Special prompt for Debian: Include variable identifying the chroot you work in in the prompt
    # (copied from default Debian .bashrc file, never actually tested)
    if [ -z "$debian_chroot" ] && [ -r "/etc/debian_chroot" ]; then
        export debian_chroot=`cat /etc/debian_chroot`
        PS1="${debian_chroot:+($debian_chroot)}${PS1}"
    fi

    export PS1 PS2 PS3 PS4
}
set_prompts
unset -f set_prompts
#-----------------------------------------------------------------------------
# End Prompt section
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Key aliases
#-----------------------------------------------------------------------------

alias refresh='. ~/.bashrc'
alias s='sudo'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

