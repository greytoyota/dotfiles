Dotfiles
========

My vim setup, for easier cross-platform management. Create sym links to have vim work properly, ie

    ln -sf /path/to/vimfiles/.vimrc ~/.vimrc
    ln -sf /path/to/vimfiles/.vim ~/.vim

*Note:* Must use absolute path for first argument (source file)! Otherwise will
run into issues with symbolic loops.

Add new plugins as submodules, ie

    git submodule add https://github.com/AUTHOR/REPO.git .vim/bundle/REPO

And then initialize them on other computers, ie

    git submodule update --init

To pull in new versions of each plugin, run

    git submodule update
