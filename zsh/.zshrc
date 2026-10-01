# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# # vi mode
bindkey -v
export KEYTIMEOUT=1

# To alter the cursor when using vim mode
# _fix_cursor() {
#    echo -ne '\e[5 q'
# }
# precmd_functions+=(_fix_cursor)

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Set cursor style (DECSCUSR), VT520.
# 0  ⇒  blinking block.
# 1  ⇒  blinking block (default).
# 2  ⇒  steady block.
# 3  ⇒  blinking underline.
# 4  ⇒  steady underline.
# 5  ⇒  blinking bar, xterm.
# 6  ⇒  steady bar, xterm.

alias v="nvim"
alias e="vim"
alias ll="ls -lah"
alias lr="ls -lahr"

export MANPAGER="nvim +Man!"
# export PAGER="nvim -R"
# git config --global core.pager "nvim -R"
# git config --global color.pager no

[ -f "/home/elem/.ghcup/env" ] && . "/home/elem/.ghcup/env" # ghcup-env

export EDITOR=nvim

export PATH="$PATH:$HOME/bin"

eval "$(starship init zsh)"
export LC_ALL=en_IN.UTF-8

source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

setopt EXTENDED_GLOB
setopt NULLGLOB

alias fd="fd -HI"
alias d="dirs -v | head -10"
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

