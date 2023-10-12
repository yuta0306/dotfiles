#!/bin/env bash
set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

lock_dotfiles() {
  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  echo creating backup...
  # mkdir -p $HOME/dotbackup/
  if [[ "$HOME" != "$dotdir" ]];then
    for f in $HOME/.??*; do
      [[ `basename $f` == ".Trash" ]] || [[ `basename $f` == ".cache" ]] && continue
      [[ `basename $f` == ".git" ]] && continue
      # command cp -r $f $HOME/dotbackup/
      if [ ! -e $dotdir/`basename $f` ] && [ ! -d $dotdir/`basename $f` ]; then
        echo cp -r $f $dotdir/
        command cp -r $f $dotdir/
        command rm -r $f
        echo $f removed
        echo create link $dotdir/$(basename $f) to $f
        echo command ln -s $dotdir/$(basename $f) $f
        command ln -s $dotdir/$(basename $f) $f
      fi
    done
  else
    command echo "same install src dest"
  fi
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

lock_dotfiles
git config --global include.path "~/.gitconfig_shared"
command echo -e "\e[1;36m Install completed!!!! \e[m"

