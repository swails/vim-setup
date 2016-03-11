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
- [NERDTree](https://github.com/scrooloose/nerdtree.git) (``bundle/nerdtree``)

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

### Installing bundles

#### vim-go

The first thing you need to do is clone ``vim-go`` from GitHub. Because we are
using ``pathogen`` (already installed), cloning is all we have to do to install
this plugin (-:

```bash
cd $HOME/.vim/bundle
git clone https://github.com/fatih/vim-go.git
```

#### nerdtree

Like ``vim-go`` above, NERDTree is very easy to install with pathogen -- just
clone the repository (-:

```bash
cd $HOME/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
```

The vimrc file here allows the control sequence Ctrl-n to create a split to the
left with a file browser (or turn it off if it's already on).

An alternative package (that *only* shows the file buffers, not the whole
filesystem) is Mini Buffer explorer, which I used before discovering NERDTree.
You can see portions of my vimrc commented out that utilize that plugin. You can
download that plugin from https://github.com/fholgado/minibufexpl.vim and clone
it in the ``bundle`` directory. With NERDTree, it's not particularly necessary.

#### YouCompleteMe

YouCompleteMe is more complicated to install.  It requires Python 2.6 or 2.7 and
several other prerequisites. [Have a look at the installation
instructions](https://github.com/Valloric/YouCompleteMe#installation).
YouCompleteMe uses git submodules, so we need to download those as well. I will
also install with as many bells and whistles as I can via the following flags:

- ``--clang-completer`` -- Enables C/C++ completion by integrating with clang
- ``--gocode-completer`` -- Enables Go copmletion by integrating with an
  installed version of Go (note, you need to have Go installed and set up on
  your system for this)
- ``--tern-completer`` -- Enables Javascript completion
- ``--omnisharp-completer`` -- Enables C# completion

You can use as many (or as few) of the options as you want. Before you install
this, you will need the following packages:

- CMake
- Python 2.6 or 2.7
- Go 1.4 or later (if you want the ``--gocode-completer`` option)
- vim with Python support (you may have to rebuild on Mac or other systems where
  this support is optional, like Gentoo)
- nodejs (if you want the ``--tern-completer`` option -- On Ubuntu 14.04 you
  also need the nodejs-legacy package)
- npm (if you want the ``--tern-completer`` option)
- xbuild (mono-xbuild, if you want the ``--omnisharp-completer`` option). I
  couldn't get this to build on Ubuntu 14.04, though, so I skipped it.

```bash
cd $HOME/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
git submodule update --init --recursive
./install.py --clang-completer --gocode-completer --tern-completer
```

And you're done... phew!
