#!/bin/sh
# ZSH Configuration aliases
alias zshc="code -n $ZDOTDIR/.zshrc"
alias zshe="code -n $ZDOTDIR/.zshenv"
alias zshp="code -n $HOME/.zprofile"
# alias ohmyzsh="code -n $ZSH/oh-my-zsh"

# NPM
alias nr="npm run"
alias ni="npm install"

# Docker
alias d="docker"
alias dcom="docker compose"
alias dbsh="docker-bash"
alias dcbsh="docker-bash -compose"

# Kubernetes
alias k="kubectl"

# Terraform
alias t="terraform"
alias tw="terraform workspace"
alias twl="terraform workspace list"
alias tws="terraform workspace select"

# Python
alias python='python3'
alias pip='pip3'
alias pyvmk="python -m venv $*"
alias pyvon="python-virtual-on $*"
alias pyvoff="deactivate"

# General Purpose
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cdh="dirs -v | head -n 10"
alias cdf="change-directory-foreground"
alias please='sudo !!'
alias mkpasswd="openssl rand -base64"
alias timestamp='date -j "+%Y%m%d%H%M%S"'
alias timepoch='date -j "+%s"'
alias flush='dscacheutil -flushcache'
alias google="ping 8.8.8.8"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend" # Lock the screen (when going AFK)

# Other
alias gst='git status -sb'
alias bsup="browser-sync start --server --files '**/*.css, **/*.html, **/*.js'"
alias apl='ansible-playbook'
alias c="code"
alias sr="siteroot"
alias yl="youtube-dl"
alias mip="qurl ipinfo.io"