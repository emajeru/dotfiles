#!/bin/sh
HISTSIZE=1000000
SAVEHIST=1000000
export ZSH_CUSTOM="$HOME/Documents/Projects/zsh-custom"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-14.jdk/Contents/Home
export WORKPATH="$HOME/Documents/Work"
export WORKER_DEFAULT="${WORKPATH}/Doctors Hospital"
# export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.bin:$HOME/.bin/jazz/scmtools/eclipse:$HOME/.npm-packages/bin:"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.bin:$HOME/.npm-packages/bin:"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
# export ANDROID_HOME=/usr/local/share/android-sdk
# export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export EDITOR=vim
export GH_EDITOR=vim
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Git Hosting for private repositories
export GIT_HOSTING='git@github.com'

eval "$(/opt/homebrew/bin/brew shellenv)"