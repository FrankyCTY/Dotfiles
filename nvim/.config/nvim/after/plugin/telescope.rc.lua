local status, telescope = pcall(require, 'telescope');

if (not status) then
  return
end

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- Please refer to the main init.lua
vim.keymap.set('n', '<leader>dsg', telescope.extensions.dir.live_grep, { desc = '[D]irectory [S]earch by [G]rep' })
vim.keymap.set('n', 'd<C-p>', function() return telescope.extensions.dir.find_files({hidden = true, no_ignore = false, no_ignore_parent = false}) end, { desc = '[D]irectory [S]earch [F]iles (Include hidden files)' })
