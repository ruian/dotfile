# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

alias ls='ls -G'
alias ll='ls -Gl'
alias la='ls -Gla'
alias l='ls -Gl'

alias sublime='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl -n -a'

alias composer='php5 /Users/johndoe/Utils/composer.phar'

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

PS1='\[\e[31m\][\A]\[\e[0;32m\][\u@\h \w] $(__git_ps1 "\[\e[0;33m\]:%s ")\[\e[0m\]\$ '