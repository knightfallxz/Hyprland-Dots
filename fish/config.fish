if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -U fish_greeting ""
cat ~/.cache/wal/sequences
sh ~/.bin/colorscripts/crunchbang-mini

fish_add_path ~/.bin/
fish_add_path ~/.config/emacs/bin/
fish_add_path ~/.local/bin/
# export LD_LIBRAARY_PATH=/home/knightfall/Code/SysSec 🔒/End-sem/
set_color 94aab6

export OPENAI_API_KEY='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'
alias l="ls -lh"
# alias ls="exa"
alias nivm="nvim"
alias open="xdg-open"
alias findme="grep -nr"

alias CollegeEmail="echo College-Email = cb.en.u4cys21076@cb.students.amrita.edu"
alias GitHubToken="echo GitHubToken= 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"
alias TimeTable="open ~/Documents/Timetable.pdf"
alias nano="nvim"

alias users="cut -d: -f1 /etc/passwd | column"
alias usercount="cat /etc/passwd | wc -l"

# cd ~/Workspace
