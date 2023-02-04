[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

#---- Oh-My-ZSH -----
# export ZSH=$HOME/.config/oh-my-zsh
# ZSH_THEME="daveverwer"
# plugins=(git ansible worker)

# source $ZSH/oh-my-zsh.sh

# initialize autocomplete
autoload -U compinit add-zsh-hook
compinit

plug "$ZDOTDIR/exports.zsh"
plug "$ZDOTDIR/functions.zsh"
plug "$ZDOTDIR/aliases.zsh"

plug "$ZSH_CUSTOM/plugins/worker/worker.plugin.zsh"

plug "$ZDOTDIR/prompt.zsh"

# No more chekcing of local mail
unset MAILCHECK

# ###-tns-completion-start-###
# if [ -f /Users/edisonhanchell/.tnsrc ]; then 
#     source /Users/edisonhanchell/.tnsrc 
# fi
###-tns-completion-end-###

# . /usr/local/opt/asdf/asdf.sh
