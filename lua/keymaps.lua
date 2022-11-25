local keyset = vim.keymap.set
vim.g.mapleader = ' '
local opts = {silent = true}

-- NvimTreeToggle
keyset('', '<leader>t', ':NvimTreeToggle<Cr>', opts)

-- MarkdownPreview
keyset('n', '<leader>p', ':MarkdownPreview<Cr>', opts)

local filetype = vim.fn.expand("%:e") -- 文件类型
local filepath = vim.fn.expand("%:p") -- 文件路径
local directory = vim.fn.expand("%:p:h") -- 文件所在目录
local filename = vim.fn.expand("%:r") 
filename = string.gsub(filename,".\\","") -- 文件名称

-- 根据不同文件类型设置 <leader>r 所对应的命令
local cmd -- 命令
if filetype == 'java' then
    -- java
    cmd = ':sp<Cr>:te javac '..filepath..'&& java '..filename..'<Cr>'
elseif filetype == 'py' then
    -- python
    cmd = ':sp<Cr>:te python %<Cr>'
elseif filetype == 'm' then
    -- matlab or octave
    cmd = ':sp<Cr>:te "C:\\Program Files\\MATLAB\\R2022b\\bin\\matlab.exe" -sd "'..directory..'" -nosplash -nodesktop -batch "'..filename..'"<Cr>"'
else
    -- unkonw
    cmd = ''
    print('unknow')
end

keyset('n', '<leader>r',cmd, opts)

vim.cmd([[
	inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
]])
