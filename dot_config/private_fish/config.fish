if status is-interactive
    alias ls='ls --color=always --group-directories-first' # preferred listing
    alias la='ls -a --color=always --group-directories-first' # all files and dirs
    alias ll='ls -l --color=always --group-directories-first' # long format
    alias l='ls -Al --color=always --group-directories-first' # tree listing

    alias cl='clear' # clear the terminal
    alias s="sudo"

    bind \ee edit_command_buffer
    set -gx EDITOR code 
end
