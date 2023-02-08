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
keyset("n","<leader>rn", "<Plug>(coc-rename)", opts)

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
opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
-- keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- vim.cmd([[
-- inoremap <silent><expr> <TAB>
--       \ coc#pum#visible() ? coc#pum#next(1) :
--       \ CheckBackspace() ? "\<Tab>" :
--       \ coc#refresh()
-- inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
-- ]])
