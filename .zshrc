# Load completions
autoload -Uz compinit && compinit
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias grep='grep --color=auto'
alias yay='paru'



# Specific to My tools
# Android Studio
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

#Cargo stuff
export PATH="$HOME/.cargo/bin:$PATH"

#Pipx stuff
export PATH="$HOME/.local/bin:$PATH"

#yarn stuff
export PATH="$HOME/.yarn/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH="$PATH:/home/debnation/.local/bin"


# pnpm
export PNPM_HOME="/home/endofnation/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# flatpak
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"


setopt NO_NOMATCH
export PATH="$HOME/go/bin:$PATH"
eval "$(starship init zsh)"
export PATH="${PATH}:/home/endofnation/bin"

# pnpm
export PNPM_HOME="/home/endofnation/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
#
export EDITOR=nvim
source "$HOME/.cargo/env"
fastfetch
