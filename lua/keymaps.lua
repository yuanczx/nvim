local keyset = vim.keymap.set

vim.g.mapleader = ' '
local opts = {silent = true}
-- NvimTreeToggle
keyset('', '<leader>t', ':NvimTreeToggle<Cr>', opts)

-- Markdown预览
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

if cmd ~= '' then
    keyset('n', '<leader>r',cmd, opts)
end
-- vim.cmd([[
-- 	inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
-- ]])

-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
















