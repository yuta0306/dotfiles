#!/bin/env bash
set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir() {
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup" ];then
    command echo "$HOME/.dotbackup not found. Auto Make it"
    command mkdir "$HOME/.dotbackup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  echo $dotdir
  if [[ "$HOME" != "$dotdir" ]];then
    for f in $HOME/.??*; do
      [[ `basename $f` == ".git" ]] && continue
      echo ln -snf $f $dotdir/$(basename $f)
      command ln -snf $f $dotdir/$(basename $f)
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

link_to_homedir
git config --global include.path "~/.gitconfig_shared"
command echo -e "\e[1;36m Install completed!!!! \e[m"

