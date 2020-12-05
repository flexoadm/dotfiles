#Common settings
#System-wide .bashrc file for interactive bash(1) shells.

USERNAME=$(whoami)

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
alias kk='~/tools/bin/kubectl'
alias mts="cd ~/Documents/repos/mts"

alias pe='pyenv'
alias ped='pyenv deactivate'
alias ans='pyenv activate ansible'

#Exports
export LC_ALL=en_US.utf-8
export PATH="$PATH:$HOME/tools/bin:/Users/$USERNAME/.local/bin:/Users/$USERNAME/go/bin"

export GOPATH=/Users/$USERNAME/go
#export GOROOT=/Users/$USERNAME/go

#export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/sqlite/lib"
#export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/readline/include -I/usr/local/opt/sqlite/include"
#export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig:/usr/local/opt/sqlite/lib/pkgconfig"
#export CFLAGS="-I$(brew --prefix readline)/include -I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" 
#export LDFLAGS="-L$(brew --prefix readline)/lib -L$(brew --prefix openssl)/lib" 
export PYTHON_CONFIGURE_OPTS=--enable-unicode=ucs2
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export PYENV_ROOT=~/.pyenv

#Integrations and autocomplete
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#Python settings
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#Histoty settings
HISTTIMEFORMAT="%h %d %H:%M:%S "
HISTSIZE=1000000
HISTFILESIZE=1000000
PROMPT_COMMAND='history -a'
shopt -s histappend
shopt -s cmdhist

source $(brew --prefix)/etc/bash_completion

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/Users/ssb/yandex-cloud/path.bash.inc' ]; then source '/Users/ssb/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/Users/ssb/yandex-cloud/completion.bash.inc' ]; then source '/Users/ssb/yandex-cloud/completion.bash.inc'; fi

