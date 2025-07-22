# vim:ft=zsh ts=2 sw=2 sts=2

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

# Smart environment detection
function smart_env_prompt_info() {
    local env_info=""
    
    # Check if standard virtualenv is active
    if [[ -n $VIRTUAL_ENV ]]; then
        local env_name=$(basename $VIRTUAL_ENV)
        env_info=" %{$fg_bold[green]%}$env_name%{$reset_color%}"
    # Check if we're in a poetry project but not activated
    elif [[ -f pyproject.toml ]] && command -v poetry &> /dev/null; then
        local poetry_env=$(poetry env info --path 2>/dev/null)
        if [[ -n $poetry_env ]]; then
            local env_name=$(basename $poetry_env)
            env_info=" %{$fg[yellow]%}[(inactive) $env_name]%{$reset_color%}"
        fi
    fi
    
    echo $env_info
}

if [[ -n $WSL_DISTRO_NAME ]]; then
    PROMPT='%{$fg_bold[blue]%}%M%{$fg_bold[white]%}[%{$fg_bold[cyan]%}${WSL_DISTRO_NAME}%{$fg_bold[white]%}]: %{$fg_bold[green]%} %0~%{$reset_color%}$(git_prompt_info)$(smart_env_prompt_info) ⌚ %{$fg_bold[red]%}%*%{$reset_color%}
$ '
else
    PROMPT='%{$fg_bold[blue]%}%M: %{$fg_bold[green]%} %0~%{$reset_color%}$(git_prompt_info)$(smart_env_prompt_info) ⌚ %{$fg_bold[red]%}%*%{$reset_color%}
$ '
fi

RPROMPT='$(ruby_prompt_info)'

# Keep these for compatibility
VIRTUAL_ENV_DISABLE_PROMPT=0
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=" %{$fg[green]%}🐍"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
