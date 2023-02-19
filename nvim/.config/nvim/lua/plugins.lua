-- https://github.com/wbthomason/packer.nvim
local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

-- cmd({command}) vim.cmd() Execute Vim script commands.
-- https://neovim.io/doc/user/lua.html#vim.cmd()
vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lualine/lualine.nvim' -- Statusline
  -- use 'neovim/nvim-lspconfig' -- LSP
end)
