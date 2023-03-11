# By knightfall01 as a part of https://github.com/Knightfall01/Hyprland-i3
if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -U fish_greeting ""
cat ~/.cache/wal/sequences
sh ~/.bin/colorscripts/crunchbang-mini
export OPENAI_API_KEY='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'
alias l="exa -all"
alias ls="exa"
alias nivm="nvim"
alias GitHubToken="echo GitHubToken= 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"
alias open="xdg-open"
alias findme="grep -nr"
function extract
    if test -f $argv[1]
        switch (string match -r '*.(tar.bz2|tbz2)' $argv[1])
            case *.tar.bz2
                tar xvjf $argv[1]
            case *.tbz2
                tar xvjf $argv[1]
            case *.tar.gz
                tar xvzf $argv[1]
            case *.tgz
                tar xvzf $argv[1]
            case *.tar.xz
                tar xf $argv[1]
            case *.bz2
                bunzip2 $argv[1]
            case *.gz
                gunzip $argv[1]
            case *.tar
                tar xvf $argv[1]
            case *.zip
                unzip $argv[1]
            case *.Z
                uncompress $argv[1]
            case *.rar
                unrar x $argv[1]
            case *.7z
                7z x $argv[1]
            case '*'
                echo "No sé cómo descomprimir este '$argv[1]'..."
        end
    else
        echo "'$argv[1]' no es un archivo válido!"
    end
end

