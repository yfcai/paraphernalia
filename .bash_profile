# PS1 & PATH
export PS1='[\W]\$ '
export PATH="$HOME/bin:$PATH"


# my helpful variables
export dk="$HOME/Desktop"
export tr="$HOME/sc/AAB.tr"
export gw='caiyufei@sshgw.informatik.uni-tuebingen.de'

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

#export PATH="$PATH:$ETC/scala/2.10.3/bin" # use homebrew for scaka
export PATH="$PATH:$HOME/Library/Haskell/bin"
export PATH="$PATH:$HOME/Applications/Coq.app/Contents/Resources/bin"

# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="$HOME/etc/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# Agda versions
export PATH="$PATH:$HOME/etc/agda/current/dist/build/Agda"
export PATH="$PATH:$HOME/etc/agda/current/dist/build/agda-mode"

# OPAM configuration
. /Users/cai/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
