source ~/.dotfiles/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle dircycle
antigen bundle django
antigen bundle docker
antigen bundle extract
antigen bundle ssh-agent
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme af-magic

# Tell antigen that you're done.
antigen apply

chpwd_auto_ls () {
    ls --color=if-tty --group-directories-first -hF
}

# Enable autosuggest using async.
ZSH_AUTOSUGGEST_USE_ASYNC=1

bindkey '^ ' autosuggest-accept

export LD_LIBRARY_PATH=/usr/lib/vmware/lib/libglibmm-2.4.so.1/:$LD_LIBRARY_PATH

# Source the aliases from the dotfiles repo.
source ~/.dotfiles/zsh-extra/*.zsh

export GOPATH=~/.gopath/
export PATH=$PATH:~/.gopath/bin/:~/.local/bin/:~/.dotfiles/bin/:~/.cargo/bin

dcleanup(){
    # Cleanup the containers that have exit.
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    # Cleanup the images that are dangling i.e. not being used by any container.
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi


if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]; then
    source $HOME/.local/bin/virtualenvwrapper.sh
fi

export TERM=xterm-256color

export EDITOR='emacsclient -t'
export ALTERNATE_EDITOR=emacs

# alias vc="source `find -name 'activate'`"
export MIDGARD_SUDO_SOCK=/tmp/${USER}-sudo-sock

test -e /Users/maxking/.iterm2_shell_integration.zsh && source /Users/maxking/.iterm2_shell_integration.zsh || true
