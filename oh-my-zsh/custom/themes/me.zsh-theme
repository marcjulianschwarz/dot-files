local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

local host_color="green"
if [ -n "$SSH_CLIENT" ]; then
  local host_color="yellow"
fi

# Conditionally include hostname based on SSH connection
if [ -n "$SSH_CLIENT" ]; then
  user_host="%{$fg_bold[${host_color}]%}%n@%m%{$reset_color%} "
else
  user_host="%{$fg_bold[${host_color}]%}%n%{$reset_color%} "
fi

# Function to display conda environment if active and not "base"
conda_env() {
  if [ -n "$CONDA_DEFAULT_ENV" ] && [ "$CONDA_DEFAULT_ENV" != "base" ]; then
    echo "%{$fg_bold[yellow]%}($CONDA_DEFAULT_ENV) %{$reset_color%}"
  fi
}

# Custom git_prompt_info function with indicators in front of branch names
git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

    # Extract branch name
    local branch=${ref#refs/heads/}
    local indicator=""
    local indicator_color=""

    # Determine indicator based on branch prefix and remove prefix
    if [[ $branch == feature/* ]]; then
      branch="${branch#feature/}"
      indicator="f"
      indicator_color="%{$fg_bold[green]%}"
    elif [[ $branch == bugfix/* ]]; then
      branch="${branch#bugfix/}"
      indicator="b"
      indicator_color="%{$fg_bold[yellow]%}"
    elif [[ $branch == hotfix/* ]]; then
      branch="${branch#hotfix/}"
      indicator="h"
      indicator_color="%{$fg_bold[red]%}"
    elif [[ $branch == noissue/* ]]; then
      branch="${branch#noissue/}"
      indicator="n"
      indicator_color="%{$fg_bold[yellow]%}"
    fi

    # Truncate if longer than 40 chars
    if [[ ${#branch} -gt 40 ]]; then
      branch="${branch:0:40}..."
    fi

    # Check if dirty
    local is_dirty=0
    if [[ -n "$(command git status --porcelain 2>/dev/null | head -1)" ]]; then
      is_dirty=1
    fi

    # Format with indicator in front of branch name
    local formatted="%{$fg[white]%}("

    if [[ -n "$indicator" ]]; then
      formatted+="$indicator_color$indicator%{$reset_color%}%{$fg[white]%}/%{$reset_color%}"
    fi

    formatted+="%{$fg_bold[green]%}$branch"  # Made branch name bold green
    [[ $is_dirty -eq 1 ]] && formatted+="%{$fg[yellow]%}*%{$reset_color%}"
    formatted+="%{$fg[white]%})%{$reset_color%}"

    echo "$formatted"
  fi
}


PROMPT='$(conda_env)%{$fg_bold[yellow]%}%1~%{$reset_color%}$(git_prompt_info)$(git_remote_status)
%{$fg_bold[green]%}❯%{$reset_color%} '  # Changed prompt from cyan to green

RPROMPT='${return_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[yellow]%}↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[green]%}↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[yellow]%}↕%{$reset_color%}"
