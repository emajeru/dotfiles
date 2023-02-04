#!/bin/zsh

autoload -Uz vcs_info
autoload -U colors && colors

# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

:<<COMMENT
zstyle ':vcs_info:*' enable git 

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst


zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"

# PROMPT="%B%{$fg[yellow]%}⚡% %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT+="\$vcs_info_msg_0_ "
COMMENT

# virtualenv prompts
VIRTUALENV_CHAR=" "
VIRTUALENV_THEME_PROMPT_PREFIX=""
VIRTUALENV_THEME_PROMPT_SUFFIX=""

PROMPT_ICON_START="┌"
PROMPT_ICON_END="%F{31}└❯%F{reset} "
PROMPT_ICON_USER=" %F{178}"
PROMPT_ICON_DIRECTORY=" "
PROMPT_ICON_POINT="%F{242}"

GIT_PROMPT_ICON_BRANCH="%F{172} "
GIT_PROMPT_ICON_DIRTY="%F{210}  "
GIT_PROMPT_ICON_CLEAN="%F{34}  "

# Display virtual environment info
function virtualenv_prompt {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    virtualenv=`basename "$VIRTUAL_ENV"`
    echo -e "
  %B%F{178}$VIRTUALENV_CHAR%F{}%F{31}$virtualenv%F{}"
  fi
}

function git_prompt_info() {
  if ! git rev-parse --git-dir &> /dev/null; then
    return 0
  fi
  
  local GIT_PROMPT_BRANCH=$(git symbolic-ref --short HEAD 2> /dev/null)
  local GIT_PROMPT_SHA=$(git rev-parse --short HEAD 2> /dev/null)
  local GIT_PROMPT_SHA_STATUS=$(git status --porcelain &> /dev/null | tail -n 1)

  if [ -z "${GIT_PROMPT_SHA_STATUS}" ]; then
    GIT_PROMPT_SHA_STATUS="${GIT_PROMPT_ICON_CLEAN}"
  else
    GIT_PROMPT_SHA_STATUS="${GIT_PROMPT_ICON_DIRTY}"
  fi

  local GIT_PROMPT_INFO=" ${PROMPT_ICON_POINT}${GIT_PROMPT_ICON_BRANCH} ${GIT_PROMPT_BRANCH} ${GIT_PROMPT_SHA_STATUS}${GIT_PROMPT_SHA}"
  echo "${GIT_PROMPT_INFO}"
}

#function prompt_info() {

#%F{31}|%F{reset} "
#%F{reset}${PROMPT_ICON_END}"
#}

#TRAPEXIT() {
#  print "Exited at: $(date +"[%H:%M:%S] ")"
#  return 0
#}

VENV="\$(virtualenv_prompt)";
setopt prompt_subst
PS1="
%F{31}${PROMPT_ICON_START}$(printf %"$(($COLUMNS-2))"s |tr " " "─")
│ %F{black}%K{31}  %T %F{reset}%K{reset}${VENV}${PROMPT_ICON_USER} %F{31}%n ${PROMPT_ICON_POINT} %F{251}${PROMPT_ICON_DIRECTORY}%1~%F{reset}\$(git_prompt_info)
%F{31}│%F{reset}
${PROMPT_ICON_END}%F{reset}"
PS2="${PROMPT_ICON_END}%F{reset}"

