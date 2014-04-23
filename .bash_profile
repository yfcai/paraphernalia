# PS1 & PATH
export PS1='[\W]\$ '
export PATH="$HOME/bin:$PATH"


# my helpful variables
export dk="$HOME/Desktop"
export gw='cai@applogin.mathematik.uni-marburg.de'
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
