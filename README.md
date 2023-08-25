# vim-sandbox

Dockerfile for testing vim/neovim plugins.

## Setup

```bash
cp run.sh.sample run.sh
vi run.sh # fix USER variable for your UNIX account.

cp vimrc.sample .vimrc
vi .vimrc # fix vimscript according to your needs.
```

## Run

```bash
./run.sh # docker compose build & run
docker-compose exec -u root vim-sandbox sudo -u ${USER} nvim -u /home/${USER}/.vimrc # if you don't need to build.
```

By default, `vimrc.sample` uses:

- [dein](https://github.com/Shougo/dein.vim)
    - for plugin management
- [vim-lsp](https://github.com/prabirshrestha/vim-lsp), [vim-lsp-settings], [asyncomplete](https://github.com/prabirshrestha/asyncomplete.vim)
    - for LSP
