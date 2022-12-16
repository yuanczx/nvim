local keyset = vim.keymap.set

vim.g.mapleader = ' '
local opts = {silent = true,noremap = true}
-- NvimTreeToggle
keyset('', '<leader>t', ':NvimTreeToggle<Cr>', opts)
keyset('i', 'jk', '<esc>', opts)

-- 预览
keyset('n','H','0',opts)
keyset('n','L','$',opts)
local filetype = vim.fn.expand("%:e") -- 文件类型
local filepath = vim.fn.expand("%:p") -- 文件路径
local directory = vim.fn.expand("%:p:h") -- 文件所在目录
local filename = vim.fn.expand("%:t") 

-- filename = string.sub(filename,string.find(filename,'.',-4)) -- 文件名称无后缀
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
elseif filetype == 'tex' then
    aux_directory = directory..'\\aux'
    output_directory = directory..'\\output'
    cmd = [[:!xelatex -aux-directory="]]..aux_directory..
            [[" -output-directory="]]..output_directory..[[" %<cr>]]
    keyset('n','<leader>p',':silent !'..output_directory..'\\main.pdf<cr>',opts)
elseif filetype == 'md' then
    cmd = ' '
    keyset('n', '<leader>p', ':MarkdownPreview<Cr>', opts)
else
    -- unkonw
    cmd = ' '
end

if cmd ~= ' ' then
    keyset('n', '<leader>r',cmd, opts)
end

