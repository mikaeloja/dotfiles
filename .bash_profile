#Basic color changes
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

#aliases for grep and ls
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrepf='egrep --color=auto'
alias la='ls -A'
