<p align="center">:rice:</p>

<h1 align="center">d o t f i l e s</h1>

<h2 align="center">set-up</h2>

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

### AutoHotkey

Run `AutoHotkey/Keybinds.ahk`.  That's it.

### Bash

*Tested variants*: bash, Git Bash for Windows

You should use a Powerline font for characters to show up properly.

Create a symlink at `~/.bashrc` that points to `~/dotfiles/.bashrc`.

Create a symlink at `~/.bash_profile` that points to `~/dotfiles/.bash_profile`.

### Git

Move your `user.email` and `user.name` settings to `~/.gitconfig.user`.

Create a symlink at `~/.gitconfig` that points to `~/dotfiles/.gitconfig`.

### i3wm with KDE Plasma and compton

*Tested variants*: [i3-gaps](https://github.com/Airblader/i3)

Create a symlink at `~/.config/plasma-workspace` that points to
`~/dotfiles/.config/plasma-workspace`.  This will replace your window manager
with i3, and your compositor with compton.

Create a symlink at `~/.config/i3` that points to `~/dotfiles/.config/i3`.

Create a symlink at `~/.config/compton.conf` that points to
`~/dotfiles/.config/compton.conf`.

### Konsole

Create a symlink at `~/.local/share/konsole` that points to
`~/dotfiles/.local/share/konsole`.

### Pylint

Create a symlink at `~/.pylintrc` that points to `~/dotfiles/.pylintrc`.

### Sublime Text

You'll need Package Control installed.

Create a symlink at `~/.config/sublime-text-3/Packages/User` that points to
`~/dotfiles/.config/sublime-text-3/Packages/User`.

### Vim

*Tested variants*: vim, gVim, neovim\*, neovim-qt

Create a directory symlink at `~/.vim` that points to `~/dotfiles/.vim`.  Then
run `:PlugInstall` to install the plugins to `~/.vim/plug`.

In addition:

| Program                      | Create a link at...    | ...that points to... |
|------------------------------|------------------------|----------------------|
| gVim (Windows)               | `~/vimfiles`           | `~/.vim`             |
| neovim / neovim-qt (Windows) | `~/AppData/Local/nvim` | `~/.vim`             |
| neovim / neovim-qt (Unix)    | `~/.config/nvim`       | `~/.vim`             |

\* `nvim` colours don't work very well in `cmd` or Git Bash on Windows.

### Zsh

You should use a Powerline font for characters to show up properly.

Create a symlink at `~/.zshrc` that points to `~/dotfiles/.zshrc`.
