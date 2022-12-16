cfg_location = vim.fn.stdpath('config')

local cmd = ':silent !'..cfg_location..'/coc_plugins/fcitx-remote.exe -c'

vim.api.nvim_create_autocmd("InsertLeave",{pattern = {'*.tex','*.md'},command = cmd})
