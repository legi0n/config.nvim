# legi0n's Neovim Config

Welcome to my personal Neovim configuration.

This setup leverages [lazy.nvim](https://github.com/folke/lazy.nvim) for modern and performant plugin management.


## Prerequisites

Before proceeding with the installation, ensure the following dependencies are installed on your system:
* `git`
* `curl`

## Installation

### Clone the Repository

Clone the repository to your ~/.config/nvim directory:

```sh
git clone https://github.com/legi0n/config.nvim.git ~/.config/nvim
```

### Run the Installation Script

Navigate to the directory and execute the installation script:

```sh
cd ~/.config/nvim && bash install.sh
```

## Post Installation

Once the installation is complete, launch Neovim to allow the configuration to sync and install any necessary plugins:

```sh
nvim
```

That's it!

Lazy will install all the plugins.

Use `:Lazy` to view the current plugin status. Hit `q` to close the window.
