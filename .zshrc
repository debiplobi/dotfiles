# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# autoload -U compinit promptinit
# compinit
# promptinit; prompt gentoo
# zstyle ':completion::complete:*' use-cache 1
#
#
#
# now, simply add these two lines in your ~/.zshrc

# source antidote
source /home/endofnation/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# ~/.bashrc

#Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
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

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias yay='paru'
PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#XDG_MENU_PREFIX=arch- kbuildsycoca6 

# ~/.bashrc

# eval "$(starship init bash)"
export ZXCVBN_MAX_LENGTH=150

# Created by `pipx` on 2025-08-06 05:36:31
export PATH="$PATH:/home/debnation/.local/bin"
export PATH="/home/debnation/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/debnation/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

export PATH="/home/endofnation/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/endofnation/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# pnpm
export PNPM_HOME="/home/endofnation/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
#
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"


