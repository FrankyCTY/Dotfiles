local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

vim.opt.termguicolors = true

bufferline.setup({})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

