# Pure zsh theme settings
fpath+=$HOME/.zsh/pure
autoload -U prompinit; prompinit

PURE_PROMPT_SYMBOL='%#'
PURE_CMD_MAX_EXEC_TIME=300
prompt pure
prompt_newline='%666v'
PROMPT=" $PROMPT"

# Other
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# To keep traditional keybindings with VI set as VISUAL in zshenv
bindkey -e

# Applications aliases
alias code="open -a Visual\ Studio\ Code.app"
alias vim="nvim"
alias vi="nvim"

# aliases for grep and ls
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias la='ls -A'
alias ll='ls -alF'

# source zsh highlighter
# uncomment once zsh sytnax highlighing repo is cloned
# source /Users/moja/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# remove underlining of pathes
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
