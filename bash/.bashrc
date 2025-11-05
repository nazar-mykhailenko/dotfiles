# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

export VCPKG_ROOT="~/vcpkg"
export CXX="gcc"

source ~/git-prompt.sh
export PS1='${PROMPT_START@P}\[\e[0m\]${PROMPT_HIGHLIGHT:+\[\e[${PROMPT_HIGHLIGHT}m\]}${PROMPT_COLOR:+\[\e[${PROMPT_COLOR}m\]}${PROMPT_CONTAINER}${PROMPT_USERHOST:+${PROMPT_USERHOST@P}${PROMPT_SEPARATOR:+\[\e[0m\]${PROMPT_SEPARATOR_COLOR:+\[\e[${PROMPT_SEPARATOR_COLOR}m\]}${PROMPT_SEPARATOR@P}${PROMPT_SEPARATOR_COLOR:+\[\e[0m\]}${PROMPT_HIGHLIGHT:+\[\e[${PROMPT_HIGHLIGHT}m\]}${PROMPT_COLOR:+\[\e[${PROMPT_COLOR}m\]}}}${PROMPT_DIR_COLOR:+\[\e[${PROMPT_DIR_COLOR}m\]}${PROMPT_DIRECTORY@P}${PROMPT_GIT_COLOR:+\[\e[${PROMPT_GIT_COLOR}m\]]}$(__git_ps1)\[\e[0m\]\n${PROMPT_END@P}\$ ${PROMPT_END:+\[\e[0m\]}'
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
