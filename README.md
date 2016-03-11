Jason's VIM Setup
=================

These are the contents of my VIM setup (on Linux or OS X, this represents the
contents of my ``${HOME}/.vim/`` folder in addition to my ``.vimrc`` file
(renamed ``_vimrc`` in this repository).

Packages I use
--------------

I use a number of vim extensions, that I list below

- [Pathogen](https://github.com/tpope/vim-pathogen) (``autoload/pathogen.vim``)
- [vim-go](https://github.com/fatih/vim-go) (``bundle/vim-go``)
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
  (``bundle/YouCompleteMe``)
- [Mini buffer explorer](https://github.com/fholgado/minibufexpl.vim)
  (``plugin/minibufexpl.vim``)

Pathogen is used to automatically load everything in ``bundle/`` into the VIM
runtime.

vim-go adds useful IDE features for Go (including running ``gofmt`` upon
writing).

YouCompleteMe adds sophisticated autocompletion for various languages.

Mini buffer explorer adds a split with a hidden buffer containing the list of
all active buffers in a clickable and easy-to-view manner. This is much better
than using tabs in my limited experience.

Getting started
---------------

Clone this repository as your ``.vim`` directory

```
git clone https://github.com/swails/vim_setup .vim
```

Alternatively, clone it somewhere and copy its contents into your
``$HOME/.vim`` folder if you don't want to clone there directly (e.g., if the
directory already exists).

Then make sure you copy the ``_vimrc`` file as ``$HOME/.vimrc`` (a symlink will
work and prevent you from having to keep two copies up-to-date).

``YouCompleteMe`` also needs to be installed.  See instructions on their [GitHub
repository](https://github.com/Valloric/YouCompleteMe) for more detailed
installation instructions.
