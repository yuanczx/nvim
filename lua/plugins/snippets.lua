local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

vim.cmd[[
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
    snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
    imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
    smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]


ls.add_snippets("all", {
    s("ls", {
        t({"\\begin{itemize}",
        "\t\\item "}), i(1),
        t({"", "\\end{itemize}"}), i(0)
    })
})

ls.add_snippets("java",{
    s("main",{
        t({"public static void main(String[] args){"}),i(0),
        t({"}"})
    })
})


ls.add_snippets("c",{
    s("main",{
        t{"int main(){\n"},i(0),
        t{'return 0;\n}'}
    })
})
