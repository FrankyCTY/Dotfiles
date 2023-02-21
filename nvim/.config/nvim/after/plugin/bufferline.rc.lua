local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

vim.opt.termguicolors = true

bufferline.setup({
  options = {
    mode = "tabs",
    -- separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#30354e',
      -- Unselected buffer tab separator background
      bg ='#1d202f',
    },
    separator_selected = {
      fg = '#1d202f',
      bg ='#1d202f',
    },
    background = {
      fg = '#657b83',
      -- Unselected buffer tab background
      bg ='#1d202f',
    },
    buffer_selected = {
      -- text color
      fg = '#fdf6e3',
      -- tab background color
      bg = '#434a6d',
      bold = true,
    },
    fill = {
      -- Track background
      -- bg = '#30354e'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

