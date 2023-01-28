local cfg_location = vim.fn.stdpath('config')

local cmd_eng = ':silent !'..cfg_location..'/coc_plugins/fcitx-remote.exe -c'
-- local cmd_cn = ':silent !'..cfg_location..'/coc_plugins/fcitx-remote.exe -o'

vim.api.nvim_create_autocmd("InsertLeave",{pattern = {'*.tex','*.md'},command = cmd_eng})
-- vim.api.nvim_create_autocmd("InsertEnter",{pattern = {'*.tex','*.md'},command = cmd_cn})

vim.api.nvim_create_autocmd({'BufEnter','BufWinEnter'},{
        pattern={'*.ts','*.js'},
        callback = function()
            vim.opt.tabstop = 2
            vim.opt.shiftwidth = 2
        end
})
