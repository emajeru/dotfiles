
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="daveverwer"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ansible worker lscm)

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# initialize autocomplete
autoload -U compinit add-zsh-hook
compinit

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

#---- Aliases-----
# ZSH Configuration aliases
alias zshc="code -n ~/.zshrc"
alias zshe="code -n ~/.zshenv"
alias zshp="code -n ~/.zprofile"
alias ohmyzsh="code -n ~/.oh-my-zsh"

# NPM
alias nr="npm run"
alias ni="npm install"
alias c="code"
alias sr="siteroot"

# Docker
alias d="docker $*"
alias dcom="docker-compose $*"
alias dbsh="docker exec -it $@ /bin/bash"

# Python
alias pyvmake="python -m venv $*"
alias pyvon='{echo again; echo ${1}; echo someting_else;}'
alias pyvoff="deactivate"

alias python='python3'
alias pip='pip3'
alias gst='git status -sb'
alias bsup="browser-sync start --server --files '**/*.css, **/*.html, **/*.js'"
alias apl='ansible-playbook'

# General Purpose
alias cdh="dirs -v | head -n 10"
alias please='sudo !!'
alias mkpasswd="openssl rand -base64"
alias timestamp='date "+%Y%m%d%H%M%S"'
alias flush='dscacheutil -flushcache'
alias google="ping 8.8.8.8"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend" # Lock the screen (when going AFK)

# No more chekcing of local mail
unset MAILCHECK

# Git Hosting for private repositories
export GIT_HOSTING='git@bitbucket.org'

# virtualenv prompts
VIRTUALENV_CHAR="ⓔ "
VIRTUALENV_THEME_PROMPT_PREFIX=""
VIRTUALENV_THEME_PROMPT_SUFFIX=""

icon_start="┌"
icon_user="👨🏾‍💻 "
icon_host=" @ 💻 "
icon_directory=" in 📁 "
icon_branch="🌿"
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
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔%{$reset_color%}"

# Runs prompt (this bypasses bash_it $PROMPT setting)
# PROMPT=prompt_command
prompt_command

###-tns-completion-start-###
if [ -f /Users/edisonhanchell/.tnsrc ]; then 
    source /Users/edisonhanchell/.tnsrc 
fi
###-tns-completion-end-###
