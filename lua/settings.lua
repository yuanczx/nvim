local filetype = vim.fn.expand("%:e") -- 文件类型
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- 设置Tab长度为4
if(filetype == 'ts') then
    vim.opt.tabstop = 2
else
    vim.opt.tabstop = 4
end
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.splitbelow = true
vim.g.do_filetype_lua = 1
-- 显示行号
vim.wo.number = true
vim.wo.rnu = true
