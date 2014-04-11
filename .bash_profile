# PS1 & PATH
export PS1='[\W]\$ '
export PATH="$HOME/bin:$PATH"


# my helpful variables
export dk="$HOME/Desktop"
export gw='cai@balaka.mathematik.uni-marburg.de'
export server='yfcai@plse.mathematik.uni-marburg.de'

# my helpful aliases
# alias cldk="rm -rf $dk/*" # too dangerous
# alias rmsm="rm -rf a.out.dSYM"
alias sshgw="ssh $gw"
alias sc=". $HOME/bin/sc"
alias resetsc=". $HOME/bin/resetsc"
resetsc # sets env-var $SCDIR
alias setsc=". $HOME/bin/setsc"
alias refresh="cd / && cd -"
# todo: turn `refresh` into a script
# so that one can write `refresh ls` and `refresh scala` and `refresh`.

# INSTALLATIONS
export ETC="$HOME/sc/EEE.etc"

export PATH="$PATH:$ETC/scala/2.10.3/bin"

##
# Your previous /Users/cai/.bash_profile file was backed up as /Users/cai/.bash_profile.macports-saved_2014-03-07_at_16:55:51
##

# MacPorts Installer addition on 2014-03-07_at_16:55:51: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

