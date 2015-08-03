# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'Specify %d'
zstyle ':completion:*' completer _expand _complete _ignored _prefix
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' max-errors 0
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/reuven/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

alias ls='ls --color=auto'

case $TERM in *xterm*)
  precmd () {print -Pn "\e]0;%~\a"}
  preexec () {print -Pn "\e]0;$2\a"}
esac

PS1=$'\n%B%~%#%b '
function precmd() {
  GIT_BRANCH=$(git branch 2>/dev/null | sed -n 's/^\*\ //p')
  if [[ $GIT_BRANCH == "" ]]; then
    RPROMPT=""
  else
    RPROMPT="%B[$GIT_BRANCH]%b"
  fi
}

# v in normal mode to edit the command line in vi
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Rebind / and ? in normal mode for incremental search
# (incidentally unreverses the search direction)
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

GOPATH=/home/reuven/code/go
