local status, dirTelescope = pcall(require, 'dir-telescope')

if (not status) then
  return
end

dirTelescope.setup({
      hidden = true,
      respect_gitignore = true,
    })

-- As telescope extension
require("telescope").load_extension("dir")
