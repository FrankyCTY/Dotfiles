-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.g.gitblame_enabled = 0

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  },
  {
    'folke/tokyonight.nvim',
  },
  -- For the file icons
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
  },
  {
    'MunifTanjim/prettier.nvim',
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    -- config = function()
    --   require('dashboard').setup {
    --     -- config
    --   }
    -- end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'glacambre/firenvim',
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    cond = not not vim.g.started_by_firenvim,
    build = function()
      require('lazy').load { plugins = 'firenvim', wait = true }
      vim.fn['firenvim#install'](0)
    end,
  },
  {
    'f-person/git-blame.nvim',
  },
  {
    'axelvc/template-string.nvim',
  },
  {
    'princejoogie/dir-telescope.nvim',
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
