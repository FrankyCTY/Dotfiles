local status, nvimtree = pcall(require, 'nvim-tree')
if not status then
  return
end

nvimtree.setup {
  open_on_setup = false,
  view = {
    side = 'right',
    width = 45,
  },
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  filters = {
    dotfiles = true,
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = 'none',
    highlight_modified = 'none',
    root_folder_label = ':~:s?$?/..?',
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = '└',
        edge = '│',
        item = '│',
        bottom = '─',
        none = ' ',
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = 'before',
      modified_placement = 'after',
      padding = ' ',
      symlink_arrow = ' ➛ ',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default = '',
        symlink = '',
        bookmark = '',
        modified = '●',
        folder = {
          arrow_closed = '>',
          arrow_open = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          unstaged = '✗',
          staged = '✓',
          unmerged = '',
          renamed = '➜',
          untracked = '★',
          deleted = '',
          ignored = '◌',
        },
      },
    },
    special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
    symlink_destination = true,
  },
}

local function tab_win_closed(winnr)
  local api = require 'nvim-tree.api'
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w)
    return w ~= winnr
  end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match '.*NvimTree_%d*$' then -- close buffer was nvim tree
    -- Close all nvim tree on :q
    if not vim.tbl_isempty(tab_bufs) then -- and was not the last window (not closed automatically by code below)
      api.tree.close()
    end
  else -- else closed buffer was normal buffer
    if #tab_bufs == 1 then -- if there is only 1 buffer left in the tab
      local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      if last_buf_info.name:match '.*NvimTree_%d*$' then -- and that buffer is nvim tree
        vim.schedule(function()
          if #vim.api.nvim_list_wins() == 1 then -- if its the last buffer in vim
            vim.cmd 'quit' -- then close all of vim
          else -- else there are more tabs open
            vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
          end
        end)
      end
    end
  end
end

vim.api.nvim_create_autocmd('WinClosed', {
  callback = function()
    local winnr = tonumber(vim.fn.expand '<amatch>')
    vim.schedule_wrap(tab_win_closed(winnr))
  end,
  nested = true,
})

-- Open nvim on start up
local function open_nvim_tree()
  -- open the tree
  require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = open_nvim_tree,
})
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<cr>')
vim.api.nvim_create_autocmd('BufEnter', {
  command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
  nested = true,
})
