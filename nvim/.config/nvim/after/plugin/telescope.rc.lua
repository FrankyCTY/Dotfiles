local status, telescope = pcall(require, 'telescope');

if (not status) then
  return
end

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- Please refer to the main init.lua
