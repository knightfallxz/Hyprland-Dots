# By knightfall01 as a part of https://github.com/Knightfall01/Hyprland-i3
prompt off

autoload -Uz add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%F{2}⚡%f%F{3}%b%f'
setopt prompt_subst

CLEAN_ICON=''
UNSTAGED_ICON=''
STAGED_ICON=''
UNTRACKED_ICON=''

git_prompt () {
    clean=" %F{2}$CLEAN_ICON%f"
    unstaged=" %F{3}$UNSTAGED_ICON%f"
    staged=" %F{2}$STAGED_ICON%f"
    untracked=" %F{1}$UNTRACKED_ICON%f"
    git_status=""

    if [ -z "${vcs_info_msg_0_}" ]; then
        return 0
    fi

    if [[ -z "$(git status -s)" ]]; then
        echo "$clean "
        return 0
    fi
    
    if [[ -n "$(git diff --cached --name-only 2>/dev/null)" ]]; then
        git_status+=$staged
    fi

    if [[ -n "$(git diff --name-only 2>/dev/null)" ]]; then
        git_status+=$unstaged
    fi

    if [[ -n "$(git ls-files -o)" ]]; then
        git_status+=$untracked
    fi

    echo "$git_status "
}

precmd() {
    precmd() {
      last_command="$(fc -ln -1)"
      if [[ $last_command != "clear" ]]; then
        echo
      fi
    }
}

PROMPT=' %F{green}  %B%F{6}%~ ${vcs_info_msg_0_}$(git_prompt)%F{bright-gray}%f '
