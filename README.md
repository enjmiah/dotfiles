dotfiles
========

## Set-up

Do a recursive clone of this repository to your home directory.

    git clone --recursive https://github.com/enjmiah/dotfiles.git

Notes:

+ `~` refers to the `%USERPROFILE%` variable on Windows.
+ Symlinks can be done on Unix with
    ```sh
    ln -s pointed_to point_from
    ```
    On Windows, the syntax is
    ```batch
    mklink point_from pointed_to
    ```
    for files and
    ```batch
    mklink /d point_from pointed_to
    ```
    for directories, and requires administrator privileges.  Note that the
    argument order for `mklink` is reversed compared to `ln`.
+ For programs without a "Tested variants" section, assume the most common
    variant.

### Bash

*Tested variants*: bash, Git Bash for Windows

Create a symlink at `~/.bashrc` that points to `~/dotfiles/.bashrc`.

Create a symlink at `~/.bash_profile` that points to `~/dotfiles/.bash_profile`.

### Git

Move your `user.email` and `user.name` settings to `~/.gitconfig.user`.

Create a symlink at `~/.gitconfig` that points to `~/dotfiles/.gitconfig`.

### Pylint

Create a symlink at `~/.pylintrc` that points to `~/dotfiles/.pylintrc`.

### Vim

*Tested variants*: vim, gVim, neovim\*, neovim-qt

Create a directory symlink at `~/.vim` that points to `~/dotfiles/.vim`.

In addition:

| Program                      | Create a link at...    | ...that points to... |
|------------------------------|------------------------|----------------------|
| gVim (Windows)               | `~/vimfiles`           | `~/.vim`             |
| neovim / neovim-qt (Windows) | `~/AppData/Local/nvim` | `~/.vim`             |
| neovim / neovim-qt (Unix)    | `~/.config/nvim`       | `~/.vim`             |

\* `nvim` colours don't work very well in `cmd` or Git Bash on Windows.

### Zsh

Create a symlink at `~/.zshrc` that points to `~/dotfiles/.zshrc`.