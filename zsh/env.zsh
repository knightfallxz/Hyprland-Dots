# editor
# By knightfall01 as a part of https://github.com/Knightfall01/Hyprland-i3
export VISUAL="neovide"
export EDITOR="nvim"

export PATH="$PATH:$HOME/.local/bin"

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

export LS_COLORS="$(vivid -m 8-bit generate iceberg-dark)"

export SUDO_PROMPT="Password   "
