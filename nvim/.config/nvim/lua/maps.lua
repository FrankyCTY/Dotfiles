local keymap = vim.keymap

-- Reference
-- keymap
-- https://neovim.io/doc/user/lua.html#lua-keymap

-- Make x won't yank
-- wthe "_ register is a special register that represents the "black hole" register,
-- which essentially discards any text that is yanked or deleted into it.
keymap.set('n', 'x', '"_x')

-- Delete backwards
keymap.set('n', 'dw', 'vb"_d')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'db', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 's-', ':split<Return><C-w>w')
keymap.set('n', 's|', ':vsplit<Return><C-w>w')
-- Move between windows
keymap.set('n', '<Space>', '<C-w>w')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
