#!/bin/bash

#===================================
# get home_vimrc, home_vim_runtime
#===================================
home_dir=~
home_vimrc="${home_dir}/.vimrc"
home_vim_runtime="${home_dir}/.vim_runtime"

#================================
# get bak_dir name
#================================
cur_time=`date +%Y-%m-%d-%H-%M-%S`
bak_dir="${home_dir}/vimrc_bak_${cur_time}"

#===================================
# if vimrc exist, mv it to bak_dir
#===================================
if [ -f "${home_vimrc}" ]; then
    mkdir ${bak_dir}
    if [ ! -d "${bak_dir}" ]; then
        echo "[Error] mkdir ${bak_dir} failed! Install fail and exit!"
        exit 1
    else
        mv ${home_vimrc} ${bak_dir}
        echo "[info] mv ${home_vimrc} ${bak_dir}"
    fi
fi

#========================================
# if vim_runtime exist, mv it to bak_dir
#========================================
if [ -d "${home_vim_runtime}" ]; then
    mv ${home_vim_runtime} ${bak_dir}
    echo "[info] mv ${home_vim_runtime} ${bak_dir}"
fi

#========================================
# cp .vimrc .vim_runtime to home_dir
#========================================
cp vimrc ${home_dir}/.vimrc
cp -r vim_runtime ${home_dir}/.vim_runtime

#========================================
# check if copy success
#========================================
if [ -f "${home_vimrc}" ] && [ -d "${home_vim_runtime}" ]; then
    echo "Installed the gVim configuration successfully! Enjoy :-)"
else
    echo "Installed the gVim configuration fail!"
fi
