[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# initialize autocomplete
autoload -U compinit add-zsh-hook edit-command-line
compinit

plug "$ZDOTDIR/exports.zsh"
plug "$ZDOTDIR/functions.zsh"
plug "$ZDOTDIR/aliases.zsh"
plug "$ZDOTDIR/git.plugin.zsh" 

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
