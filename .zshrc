export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

#---- Oh-My-ZSH -----
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="daveverwer"
ZSH_CUSTOM="$HOME/Documents/Projects/zsh-custom"
plugins=(git ansible)

source $ZSH/oh-my-zsh.sh

# initialize autocomplete
autoload -U compinit add-zsh-hook
compinit

#---- Aliases -----
# ZSH Configuration aliases
alias zshc="code -n ~/.zshrc"
alias zshe="code -n ~/.zshenv"
alias zshp="code -n ~/.zprofile"
alias ohmyzsh="code -n ~/.oh-my-zsh"

# NPM
alias nr="npm run"
alias ni="npm install"

# Docker
alias d="docker $*"
alias dcom="docker-compose $*"
alias dbsh="docker-bash $*"

# Kubernetes
alias k="kubectl $*"

# Python
alias python='python3'
alias pip='pip3'
alias pyvmk="python -m venv $*"
alias pyvon="python-virtual-on $*"
alias pyvoff="deactivate"
alias p="python"

# General Purpose
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cdh="dirs -v | head -n 10"
alias cdf="change-directory-foreground"
alias please='sudo !!'
alias mkpasswd="openssl rand -base64"
alias timestamp='date "+%Y%m%d%H%M%S"'
alias flush='dscacheutil -flushcache'
alias google="ping 8.8.8.8"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend" # Lock the screen (when going AFK)

# Other
alias gst='git status -sb'
alias bsup="browser-sync start --server --files '**/*.css, **/*.html, **/*.js'"
alias apl='ansible-playbook'
alias c="code"
alias sr="siteroot"

# No more chekcing of local mail
unset MAILCHECK

# Git Hosting for private repositories
export GIT_HOSTING='git@github.com'

# virtualenv prompts
VIRTUALENV_CHAR=" "
VIRTUALENV_THEME_PROMPT_PREFIX=""
VIRTUALENV_THEME_PROMPT_SUFFIX=""

icon_start="┌"
icon_user=" %F{178}%F{} "
icon_host=" @ 💻 "
icon_directory=" "
icon_branch=""
icon_point="%F{242}"
icon_end="└❯ "

# SCM prompts
SCM_NONE_CHAR=""
SCM_GIT_CHAR="[±] "
SCM_GIT_BEHIND_CHAR="${red}↓${normal}"
SCM_GIT_AHEAD_CHAR="${bold_green}↑${normal}"
SCM_GIT_UNTRACKED_CHAR="⌀"
SCM_GIT_UNSTAGED_CHAR="${bold_yellow}•${normal}"
SCM_GIT_STAGED_CHAR="${bold_green}+${normal}"

SCM_THEME_PROMPT_DIRTY=""
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

# Git status prompts
GIT_THEME_PROMPT_DIRTY=" ${red}✗${normal}"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓${normal}"
GIT_THEME_PROMPT_PREFIX=""
GIT_THEME_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ${icon_point}%F{210}  "
ZSH_THEME_GIT_PROMPT_CLEAN=" ${icon_point}%F{34}  "

# Runs prompt (this bypasses bash_it $PROMPT setting)
# PROMPT=prompt_command
prompt_command

###-tns-completion-start-###
if [ -f /Users/edisonhanchell/.tnsrc ]; then 
    source /Users/edisonhanchell/.tnsrc 
fi
###-tns-completion-end-###
