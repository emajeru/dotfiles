eval "$(/opt/homebrew/bin/brew shellenv)"

path=("$HOME/.npm-packages/bin" $path)
export PATH

export VIRTUAL_ENV_DISABLE_PROMPT=1