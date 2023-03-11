# By knightfall01 as a part of https://github.com/Knightfall01/Hyprland-i3
if [[ ! -f $HOME/.config/zsh/zcomet/bin/zcomet.zsh ]]; then
  git clone https://github.com/agkozak/zcomet.git $HOME/.config/zsh/zcomet/bin
fi

zstyle ':zcomet:*' home-dir $HOME/.config/zsh/zcomet/bin
zstyle ':zcomet:*' repos-dir $HOME/.config/zsh/zcomet/repos
zstyle ':zcomet:*' snippets-dir $HOME/.config/zsh/zcomet/snippets

source $HOME/.config/zsh/zcomet/bin/zcomet.zsh

zcomet load zsh-users/zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[precommand]=fg='green','bold'
ZSH_HIGHLIGHT_STYLES[comment]='none'
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg='green'

zcomet load zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

zcomet load hlissner/zsh-autopair
