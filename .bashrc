# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

alias ls='ls -G'
alias ll='ls -Gl'
alias la='ls -Gla'
alias l='ls -Gl'

alias sublime='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl -n -a'

alias composer='php5 ~/Utils/composer.phar'
alias csfixer='php5 ~/Utils/php-cs-fixer.phar'
alias addhost='sudo ~/Utils/addHost.sh'
alias addVhost='sudo ~/Utils/addVhost.sh'
alias rmDSTORE="find . -name \".DS_Store\" -exec rm {} \;"

# PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi

source ~/.git-prompt.sh
source ~/.git-completion.bash

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"

PS1='\[\e[0;33m\][Rock\[\e[0;32m\]⚡\[\e[0;33m\]Hard]\[\e[31m\][\A]\[\e[0;32m\][\[\e[0;94m\]\u\[\e[0;32m\]@\h \w] $(__git_ps1 "\[\e[0;33m\]:%s ")\[\e[0m\] \$ '

PATH=$PATH:~/pear/bin/:/usr/local/sbin:"/Applications/Google Chrome.app/Contents/MacOS/"