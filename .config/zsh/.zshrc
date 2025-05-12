#zmodload zsh/zprof  # <-- Only enable when profiling

# Autocomplete
autoload -Uz compinit
compinit

# Lazy-load NVM
export NVM_DIR="$HOME/.config/nvm"
load-nvm() {
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
  unset -f load-nvm
}

#[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^k' kill-line
bindkey '^u' backward-kill-line

# allow up and down arrows to trigger search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^Xe' edit-command-line

source "$ZDOTDIR/exports.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/git.plugin.zsh" 
source "$ZSH_CUSTOM/plugins/worker/worker.plugin.zsh"

setopt prompt_subst
autoload -U colors && colors
autoload edit-command-line
zle -N edit-command-line

source "$ZDOTDIR/prompt.zsh"

unset MAILCHECK

autoload -U add-zsh-hook
add-zsh-hook precmd _update_code_info
add-zsh-hook precmd precmd_update_prompt
#add-zsh-hook precmd load-nvm

#zprof  # <-- Only enable when profiling
