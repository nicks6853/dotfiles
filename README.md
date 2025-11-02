# dotfiles
Compilation of my customized dotfiles

## Installation
To install all the dotfiles, use GNU stow.

First, install `stow` with your distribution's package manager. For example, on Ubuntu:

```bash
sudo apt-get install stow
```

Then, enter the `files` directory in this repository, and run the stow command with the source and target directories.

```bash
stow . -d . -t "$HOME"
```

This will symlink all the configuraitons in this repository to the corresponding location in the "~/" directory.

