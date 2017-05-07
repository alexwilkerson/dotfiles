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

PATH="/Users/alex/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/alex/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/alex/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/alex/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/alex/perl5"; export PERL_MM_OPT;
alias crawl="/Applications/Dungeon\ Crawl\ Stone\ Soup\ -\ Console.app/Contents/Resources/crawl"
