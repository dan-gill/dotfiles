# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Plugins
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bundler
  git
  pod
  z
)

# Fixes a warning when initializing zsh that can be safely silented.
# See https://github.com/ohmyzsh/ohmyzsh/issues/6835#issuecomment-390216875
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

################################################################################
# User configuration
################################################################################

# Navigate to Projects folder if trying to open a new window under $HOME (which
# is the default folder). This works alongside "New tabs open with: Same Working
# Directory" behavior.
if [[ $PWD == $HOME ]]; then
  cd $HOME/Documents/Projects
fi

# Run Powerline Shell
function powerline_precmd() {
  PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
  install_powerline_precmd
fi

# Initialize rbenv if it's already installed
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# Load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

################################################################################
# Exports
################################################################################

source "$HOME/.exports"
source "$HOME/.paths"

################################################################################
# Aliases
################################################################################

source "$HOME/.aliases"

################################################################################
# Secrets
################################################################################

source "$HOME/.secrets"
