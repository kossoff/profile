# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

if [ -d $HOME/".oh-my-zsh" ]
then
  
else
  git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:$PATH:$HOME/.rvm/bin:$HOME/bin" # Add RVM to PATH for scripting

# rw-r--r-- for new files
umask 022

export PAGER=less

LANG="ru_RU.UTF-8"
LC_CTYPE="ru_RU.UTF-8"
LC_COLLATE="POSIX"
LC_ALL="ru_RU.UTF-8"

# rigth prompt with clock
RPROMPT="  %{$fg_bold[black]%}%D{%d/%m/%y %H:%M:%S}%{${reset_color}%}"

BLOCKSIZE=M
export BLOCKSIZE

# включает горячие клавиши из emacs, -v из vim
bindkey -e
# разворачивание пути к команде
#bindkey 'вбить сочетание клавиш' expand-cmd-path
bindkey '^[[3~' delete-char

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_NO_STORE

setopt AUTOCD BSD_ECHO
setopt CORRECT_ALL

# for Tramp Mode in (Aqua|E)macs
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '

sh ~/bin/addgitdiff

if [ "$SSH_TTY" ]; then
  if [ ! "$STY" ] ; then
    if $(screen -ls | grep -q pts) ; then
      screen -x;
    else
      screen -R;
    fi
  fi
fi
