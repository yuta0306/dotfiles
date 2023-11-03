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
