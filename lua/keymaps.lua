local keyset = vim.keymap.set
vim.g.mapleader = ' '
local opts = {silent = true}

keyset('', '<leader>t', ':NvimTreeToggle<Cr>', opts)
keyset('n', '<leader>p', ':MarkdownPreview<Cr>', opts)
local filetype = vim.api.nvim_eval([[expand("%:e")]])
local filepath = vim.api.nvim_eval([[expand("%:p")]])
local cmd
if filetype == 'm' then
    cmd = ':sp<Cr>:te octave --no-gui --persist -q %<Cr>'
elseif filetype == 'java' then
    local filename = vim.api.nvim_eval([[expand("%:r")]])
    cmd = ':sp<Cr>:te javac '..filepath..'&& java '..filename..'<Cr>'
elseif filetype == 'py' then
    cmd = ':sp<Cr>:te python %<Cr>'
else
    cmd = ''
    print('unknow')
end

keyset('n', '<leader>r',cmd, opts)

function runcode()
    local code = vim.fn.getreg('"')
    local rc = ':sp<Cr>:te octave --no-gui --persist -q --eval "'..code..'"'
    vim.api.nvim_input(rc)
end


keyset('n', '<leader>sr',':lua runcode()<Cr>')


vim.cmd([[
	inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
]])
