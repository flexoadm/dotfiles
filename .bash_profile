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


alias kk='/usr/local/bin/kubectl'
alias kkgct='/usr/local/bin/kubectl config get-contexts'
alias kkuct='/usr/local/bin/kubectl config use-context'
alias kksctc='/usr/local/bin/kubectl config set-context --current --namespace'

alias mts="cd ~/Documents/repos/mts"

alias pe='pyenv'
alias ped='pyenv deactivate'
alias ans='pyenv activate ans'

alias tf='/usr/local/bin/terraform'

#Exports
export LC_ALL=en_US.utf-8
export PATH="$HOME/tools/bin:/Users/$USERNAME/.local/bin:/Users/$USERNAME/go/bin:/usr/local/opt/mongodb-community@4.2/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#Golang settings
export GOPATH=/Users/$USERNAME/go

#Integrations and autocomplete
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#Python settings
export PYTHON_CONFIGURE_OPTS=--enable-unicode=ucs2
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
#export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

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
