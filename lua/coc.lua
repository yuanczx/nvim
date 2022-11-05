local keyset = vim.keymap.set
-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local opts = {silent = true}

keyset("n", "gd", "<Plug>(coc-definition)", opts)
keyset("n", "gy", "<Plug>(coc-type-definition)", opts)
keyset("n", "gi", "<Plug>(coc-implementation)", opts)
keyset("n", "gr", "<Plug>(coc-references)", opts)

keyset("x", "<leader>f", "<Plug>(coc-format-selected)", opts)
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", opts)

-- 使用Tab切换代码提示
vim.cmd([[
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
]])
