#Common settings
#System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1='\h:\W \u\$ '

#Make bash check its window size after a process completes
shopt -s checkwinsize

[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"

#Aliases
alias als='alias'
alias t='tmux'
alias r='sudo bash'
alias ll='ls -alhG'
alias srm='ssh-keygen -R '

alias pe='pyenv'
alias ped='pyenv deactivate'

#Exports
export LC_ALL=en_US.utf-8
export PATH="$PATH:$HOME/tools/bin:/Users/sergey.buyalsky/.local/bin"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/readline/include -I/usr/local/opt/sqlite/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig:/usr/local/opt/sqlite/lib/pkgconfig"

export PYENV_ROOT=~/.pyenv

#Integrations and autocomplete
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#Python settings
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#Histoty settings
HISTTIMEFORMAT="%h %d %H:%M:%S "
HISTSIZE=10000
HISTFILESIZE=10000
shopt -s histappend
PROMPT_COMMAND='history -a'
shopt -s cmdhist
