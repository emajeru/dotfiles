#!/bin/zsh

[[ -o interactive ]] || return

# Prompt information functions
GIT_INFO=""
VENV_INFO=""

# Prompt variables
PROMPT_BORDER_COLOR="%F{31}"
PROMPT_BORDER_START="${PROMPT_BORDER_COLOR}┌"
PROMPT_BORDER_END="${PROMPT_BORDER_COLOR}└❯ %F{reset}"
PROMPT_BORDER_TOP="─"
PROMPT_BORDER_LEFT="${PROMPT_BORDER_COLOR}│%F{reset}"
PROMPT_ICON_USER=" %F{178}"
PROMPT_ICON_DIRECTORY=" "
PROMPT_ICON_POINT="%F{242}"

# Git prompt variables
GIT_PROMPT_ICON_BRANCH="%F{172} "
GIT_PROMPT_ICON_DIRTY="%F{210}  "
GIT_PROMPT_ICON_CLEAN="%F{34}  "

# virtualenv prompts variables
VIRTUALENV_CHAR=" "
VIRTUALENV_THEME_PROMPT_PREFIX=""
VIRTUALENV_THEME_PROMPT_SUFFIX=""

# Display virtual environment info
function virtualenv_prompt {
  [[ -n "$VIRTUAL_ENV" ]] || return
  local name=${VIRTUAL_ENV:t}
  echo " %F{178}$(printf '\ue0b6')%F{reset}%F{black}%K{178}${VIRTUALENV_CHAR}${name}%F{reset}%K{reset}%F{178}$(printf '\ue0b4')%F{reset}"
}

# Display git repository info
function git_prompt_info() {
  command git rev-parse --is-inside-work-tree &>/dev/null || return

  local branch sha dirty
  branch=$(command git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always)
  sha=$(command git rev-parse --short HEAD 2>/dev/null)
  command git diff --quiet --ignore-submodules HEAD &>/dev/null
  [[ $? -eq 0 ]] && dirty="${GIT_PROMPT_ICON_CLEAN}" || dirty="${GIT_PROMPT_ICON_DIRTY}"

  echo " ${PROMPT_ICON_POINT}${GIT_PROMPT_ICON_BRANCH} ${branch} ${dirty}${sha}"
}

function _update_code_info() {
  GIT_INFO="$(git_prompt_info)"
  VENV_INFO="$(virtualenv_prompt)"
}

precmd_update_prompt() {
PS1="
${PROMPT_BORDER_START}${PROMPT_BORDER_TOP}%F{31}$(printf '\ue0b6')%F{reset}%F{black}%K{31}󰥔 %T%F{reset}%K{reset}%F{31}$(printf '\ue0b4')%F{reset}${VENV_INFO}${PROMPT_ICON_USER} %F{31}%n ${PROMPT_ICON_POINT} %F{251}${PROMPT_ICON_DIRECTORY}%1~%F{reset}${GIT_INFO}
${PROMPT_BORDER_LEFT}
${PROMPT_BORDER_END}"
PS2="${PROMPT_BORDER_END} "
}
