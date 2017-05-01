#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
# for pyenv
eval "$(pyenv init -)"

# brew security options
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

# Vi mode
bindkey -v
export KEYTIMEOUT=1
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export CLICOLOR=1
