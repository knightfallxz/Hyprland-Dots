# By knightfall01 as a part of https://github.com/Knightfall01/Hyprland-i3

alias ls='exa'
alias la='exa -a'
alias ll='exa -lh'
alias lla='exa -alh'
alias tree='exa -T'

alias cat="bat -n --theme=Solarized\ \(dark\)"

alias nv="nvim"

alias zshrc="nv ~/.zshrc"
alias bconf="nv ~/.config/bspwm/bspwmrc"
alias sconf="nv ~/.config/sxhkd/sxhkdrc"
alias pconf="nv ~/.config/picom/picom.conf"
alias nvconf="nv ~/.config/nvim/init.lua"

alias bup="docker run -p 4000:4000 -v $HOME/Dev/Blog:/site bretfisher/jekyll-serve"

function pacman () {
  if [[ $1 == -S || $1 == -Syu ]]; then
      command sudo pacman $@
  else
    command pacman $@
  fi
}
