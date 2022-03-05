alias reload!='. ~/.zshrc'
alias latest="ls -lct1"
alias clls="clear;ls -Glah --color"
alias pingg='ping -c 4 Google'
alias grep='grep --colour=auto'
alias diff='colordiff'
alias cd..='cd ..'
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias sl=ls
alias copy='rsync -aP'
alias halt='sudo shutdown -h now'
alias reboot='sudo reboot'
alias dt='dmesg | tail'
alias dh='df -h'
alias dm='df -m'
alias x='startx'
alias wv='sudo wvdial'
alias bc='bc -l'
alias update='sudo apt update'
alias search='apt search'
alias install='sudo apt install --yes'
alias upgrade='sudo apt upgrade --yes'
alias ae='sudo $EDITOR /etc/apt/sources.list'
alias aL='dpkg -L'
alias em='emacsclient -c'
alias sem='sudo emacs -nw'
alias cb='curl -F "clbin=<-" https://clbin'
alias ss='sshuttle -r ec2 0/0 --dns -x 10.0.0.0/32 -D'
alias extract='dtrx'
alias bluetooth='sudo service bluetooth restart'

alias less='less -m -N -g -i -J --underline-special --SILENT'

if [ -f "~/.mint/mint5/mint" ]; then
	alias mint=~/.mint/mint5/mint
fi

alias desky='mosh desky -- tmux a'

alias newenv='docker run --rm -it ubuntu:latest bash'
alias rs='python manage.py runserver'
alias ipy='ipython3'

cat() {
    if hash bat 2>/dev/null; then

        bat --theme="Monokai Extended Bright" $@
    else
        cat "$@"
    fi
}

alias nw='tmux new-window'

# Split the TMux window and edit a file in lower:
function e {
    tmux split-window -n "Edit: $@" "$EDITOR $@"
}
alias emacsclient=/opt/homebrew/opt/emacs/bin/emacsclient
