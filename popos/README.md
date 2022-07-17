# pop!os 22.04 settings

## Sequence of initial setup

1. change shell to zsh `chsh`
1. install `ohmyzsh` - [ohmyz.sh](https://ohmyz.sh)
    - you might need `wget`, `curl`
1. update `zshrc` - Use dot file [link](zshrc)
1. install `neovim` - `sudo apt install neovim`
1. update `vimrc` - [Ultimate vimrc](https://github.com/amix/vimrc)
1. check nvim settings - `:checkhealth`
1. install `pyenv`
1. install python2 and python3 - `pyenv install 3.10.5 2.7.18 3.11.0b3` 
1. set pyenv global - `pyenv global 2.7.18 3.10.5`
1. install `tmux`
1. update `tmuxrc` - [tmuxrc](https://github.com/gpakosz/.tmux.git)
1. setup nfs for synology NAS - Use fstab [link](fstab)
1. install `nvidia drivers`
1. setup mount drives
1. install powerline fonts or D2 Coding font

## Deep learning setup

1. install `jupyterhub`
1. setup config for `jupyterhub`
1. install `cuda` and `cudnn`
1. install `tensorflow`
1. install `pytorch`
1. install `jaxlib`, `jax`

## Utilities

1. `nvtop` for nvidia top
1. `htop` for system process viewer

## Compile key packages

1. install `go`
1. install `bazelisk`
1. install `R`
1. install `julia`
1. setup jupyterhub with `R`, `julia`
1.

