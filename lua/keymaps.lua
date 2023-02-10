local keyset = vim.keymap.set
vim.g.mapleader = ' '

local sysname = vim.loop.os_uname().sysname

local isWindows = string.find(sysname,'Windows')~=nil


local opts = {silent = true,noremap = true}
-- NvimTreeToggle
keyset('', '<leader>t', ':NvimTreeToggle<Cr>', opts)
keyset('i', 'jk', '<esc>', opts)

-- 预览
keyset('n','H','0',opts)
keyset('n','L','$',opts)
keyset('n','<leader>d',':split term://pwsh<Cr>')
vim.cmd[[:tnoremap <Esc> <C-\><C-n>]]
vim.cmd[[:tnoremap jk <C-\><C-n>]]


-- filename = string.sub(filename,string.find(filename,'.',-4)) -- 文件名称无后缀
-- 根据不同文件类型设置 <leader>r 所对应的命令

local function run_file()

    local filetype = vim.bo.filetype -- 文件类型
    local filepath = vim.fn.expandcmd("%:p") -- 文件路径
    local directory = vim.fn.expandcmd("%:p:h") -- 文件所在目录
    local filename = vim.fn.expandcmd("%:t")

    local cmd -- 命令

    if filetype == 'java' then
        -- java
        cmd = '!javac '..filepath..'&& java '..filename
        vim.cmd(cmd)
    elseif filetype == 'py' then
        -- python
        cmd = '!python %'
        vim.cmd(cmd)
    elseif filetype == 'c' then
        -- C
        local c_file = string.sub(filename,1,string.find(filename,'.c')-1)
        if isWindows then
            c_file = c_file..'.exe'
        end
        cmd = 'silent !clang % -o '..c_file
        vim.cmd(cmd)
        vim.cmd('!'..directory..'/'..c_file)
    elseif filetype == 'cpp' then
        -- C++
        local cpp_file = string.sub(filename,1,string.find(filename,'.cpp')-1)
        if isWindows then
            cpp_file = cpp_file..'.exe'
        end
        cmd = 'silent !clang++ % -o '..cpp_file
        vim.cmd(cmd)
        vim.cmd('!'..directory..'/'..cpp_file)
    elseif filetype == 'tex' then
        local aux_directory = directory..'/auxil'
        local output_directory = directory..'/out'
        cmd = '! xelatex -interaction=nonstopmode -aux-directory='..aux_directory..' -output-directory='..output_directory..' '..filepath
        vim.cmd(cmd)
    end

end

local function file_preview()
    local filetype = vim.fn.expandcmd("%:e") -- 文件类型
    local directory = vim.fn.expandcmd("%:p:h") -- 文件所在目录

    if filetype=='md' then
        vim.cmd('MarkdownPreview')
    elseif filetype=='tex' then
        vim.cmd('silent !'..directory..'/out/'..'main.pdf')
    end

end

keyset('n', '<leader>r',run_file, opts)
keyset('n', '<leader>p',file_preview, opts)

