local status, gitblame = pcall(require, 'gitblame')

if (not status) then
  return
end

vim.keymap.set('n', '<leader>tgb', ':GitBlameToggle<CR>', {desc = '[T]oggle [G]it [B]lame'})
vim.keymap.set('n', '<leader>coc', require('gitblame').copy_commit_url_to_clipboard, { desc = '[C]ommit [O]n [C]lipboard' })
