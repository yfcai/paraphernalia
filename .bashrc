# PS1
PS1='[\W]\$ '

# my helpful variables
dk="$HOME/Desktop"
export gw='cai@balaka.mathematik.uni-marburg.de'
export server='cai@plse.informatik.uni-marburg.de'

# my helpful aliases
# alias cldk="rm -rf $dk/*" # too dangerous
alias rmsm="rm -rf a.out.dSYM"
alias sshgw="ssh $gw"
alias sc=". $HOME/bin/sc"
. "$HOME/bin/resetsc" # sets env-var $SCDIR
alias resetsc=". $HOME/bin/resetsc"
alias setsc=". $HOME/bin/setsc"
alias refresh="cd / && cd -"
# todo: turn `refresh` into a script
# so that one can write `refresh ls` and `refresh scala` and `refresh`.
