# editor
export VISUAL="neovide"
export EDITOR="nvim"

export PATH="$PATH:$HOME/.local/bin"

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

export LS_COLORS="$(vivid -m 8-bit generate iceberg-dark)"

export SUDO_PROMPT="Password   "
