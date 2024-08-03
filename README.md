# Tiagop's Neovim configs

- In a pretty usable state:
  - Dark theme
  - Some basic remaps that I use often
  - Built-in LSP (+ lsp-zero) for language servers + some bindings like go to definition
    - OOB installs language servers for Lua, TS e Java
  - nvim-dap + nvim-dap-ui for debugging
    - Currently only with configs for Deno
  - treesitter for syntax highlighting
  - telescope for easy file exploring
  - nvim-tree for file explorer
  - barbar for cool tabs
  - vim-fugitive + gitsigns for git related stuff
  - A few other plugins for quality of life (like vim-surround)

# Install

> [!WARNING]
> I'll move to [https://github.com/folke/lazy.nvim](Lazy) when I'm not lazy but for now Packer works perfectly well

## Java

I use [SKDMAN](https://sdkman.io/install) to manage Java version.
Install SDKMAN and a Java version >17 (`jdtls` requires it) with it.

## Install Packer

Just run this:

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

More info on: https://github.com/wbthomason/packer.nvim

## Install this config

```
git clone https://github.com/TiagoGrosso/nvim-config\
 ~/.config/nvim
```

## Install Plugins

1. Open any dir with `nvim .` (e.g the config dir)
1. Run `:PackerSync`
