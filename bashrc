pink=$(tput setaf 128);
sky=$(tput setaf 69);
light=$(tput setaf 75);
dark=$(tput setaf 15);
green=$(tput setaf 10);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[${pink}\]\u";   # username
PS1+="\[${dark}\] @ ";
PS1+="\[${sky}\]\h";    #host
PS1+="\[${dark}\] in ";
PS1+="\[${light}\]\W ";  #working directory
PS1+="\[${dark}\]\$ \[${reset}\]";
export PS1;


alias c='clear'           # c: Clear terminal display

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   ---------------------------
#   6. NETWORKING
#   ---------------------------

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

# for basictex
export PATH=$PATH:/Library/TeX/texbin

#for pipenv
export PATH=/Users/saket/Library/Python/3.6/bin:$PATH
PIPENV_VENV_IN_PROJECT=1

#for cpp program compile
alias cppcompile='c++ -std=c++14 -stdlib=libc++ code.cpp && printf "${green}Compiled Successfully...\n" && printf "${dark}Running... \n" && ./a.out'
debug(){
     g++ -std=c++11 -Wshadow -Wall -o "$@" "$@" -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -g;}


# for gtime unix to be used as time
export PATH="/usr/local/opt/gnu-time/libexec/gnubin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
