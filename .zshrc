# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

for f in $HOME/.zsh/?*; do
  if [ -f $f ]; then
    source $f
  else
    for f_i in $f/?*; do
      if [ -f $f_i ]; then
        source $f_i
      fi
    done
  fi
done

if [ -e $HOME/.gitconfig_shared ]; then
  git config --global include.path "~/.gitconfig_shared"
fi

export EDITOR=vim sheldon init

eval "$(sheldon source)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source "$HOME/.rye/env"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++,-L/opt/homebrew/opt/protobuf@21/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include,-I/opt/homebrew/opt/protobuf@21/lib"
export CFLAGS="-I/opt/homebrew/opt/protobuf@21/include"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

PATH="/Users/yubo1336/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/yubo1336/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/yubo1336/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/yubo1336/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/yubo1336/perl5"; export PERL_MM_OPT;

alias pip3.9="/opt/homebrew/bin/python3.9 -m pip"
alias protoc="/opt/homebrew/opt/protobuf@21/bin/protoc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

alias rsync="/opt/homebrew/bin/rsync"
