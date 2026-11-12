# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

## Custom settings ##

export EDITOR=/usr/bin/nvim
export LESS='--mouse -FRX'
export FZF_DEFAULT_OPTS='--walker=file,dir --info=inline-right --highlight-line --border=rounded --reverse'
export NNN_TRASH=1
export NNN_FCOLORS='6C8E6D6C00AF6DF4A7AC8EA7'
export NNN_COLORS='#0a0a0a0a'
export GNOME_SHELL_SLOWDOWN_FACTOR=0.6
export FZF_DEFAULT_COMMAND='fd --type f --hidden . $HOME \
    --exclude .git \
    --exclude .var \
    --exclude .cache \
    --exclude .thunderbird \
    --exclude Larian \
    --exclude .steam \
    --exclude .mozilla \
    --exclude .npm \
    --exclude .ssh \
    --exclude .ansible \
    --exclude .SteamCloud \
    --exclude Steam'

# Exec Tmux

if command -v tmux &> /dev/null && [[ -n "$PS1" ]] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [[ -z "$TMUX" ]] && [[ ! $(pgrep tmux) ]];
then
  exec tmux
fi

#Bash completion

if [ -f /etc/profile.d/bash_completion.sh ]; then
    . /etc/profile.d/bash_completion.sh
fi

#Set PS1
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
else
    PS1='┌──[\u@\h]─[\w]\n└──╼ \$ '
fi

# Alias
alias F='fzf_search'
alias UP='sudo dnf update --refresh; flatpak update'
alias RS='mpv http://161.53.122.184:8000/AAC128.aac'
alias O='xdg-open'
alias VT='$HOME/Work/cs/sh/vt.sh'
alias N='nnn -dRAie'

if command -v lsd >/dev/null 2>&1; then
    alias ls='lsd -Fh'
else
    alias ls='ls -Fh'
fi

if command -v lsd >/dev/null 2>&1; then
    alias ll='lsd -alFht'
else
    alias ll='ls -alFht'
fi


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# FZF mappings and options
[ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash

