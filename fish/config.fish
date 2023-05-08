if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -U fish_greeting ""
# cat ~/.cache/wal/sequences
sh ~/.bin/colorscripts/crunchbang-mini

fish_add_path ~/.bin/
fish_add_path ~/.config/emacs/bin/

export OPENAI_API_KEY='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'
alias l="exa -all"
alias ls="exa"
alias nivm="nvim"
alias open="xdg-open"
alias findme="grep -nr"

alias CollegeEmail="echo College-Email = cb.en.u4cys21076@cb.students.amrita.edu"
alias TimeTable="open ~/Documents/Timetable.pdf"
