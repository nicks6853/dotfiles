# Neovim Configurations

This directory contains my Neovim configurations.

## Local Configurations

The local directory is intended for machine-specific configurations.

### Local Plugins

To install plugins specific to the current machine, create a plugins.lua file in `./lua/local_cfg` and add the plugin specifications there. For example:

```lua-- ./lua/local_cfg/plugins.lua
local vim = vim
local Plug = vim.fn['plug#']

Plug('github/copilot.vim')
```

