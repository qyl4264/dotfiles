#!/bin/bash

SCRIPTDIR=$(cd $(dirname "${BASH_SOURCE[0]}") >/dev/null && pwd)

mkdir -p ../.config/nvim/
mkdir ../.vim
#echo $SCRIPTDIR
#ln -s "${SCRIPTDIR}/.tmux.conf" '~/tmuxconf'
ln -sf "${SCRIPTDIR}/.tmux.conf" "${SCRIPTDIR}/../.tmux.conf"
ln -sf "${SCRIPTDIR}/.zshrc" "${SCRIPTDIR}/../.zshrc"
ln -sf "${SCRIPTDIR}/.vimrc" "${SCRIPTDIR}/../.vimrc"
ln -sf "${SCRIPTDIR}/coc-settings.json" "${SCRIPTDIR}/../.vim/coc-settings.json"
ln -sf "${SCRIPTDIR}/.vimrc" "${SCRIPTDIR}/../.config/nvim/init.vim"

ln -sf "${SCRIPTDIR}/coc-settings.json" "${SCRIPTDIR}/../.config/nvim/coc-settings.json"

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
