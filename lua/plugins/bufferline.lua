vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        offsets = {{
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left'
        }}
    }
}


local keymap = vim.keymap
keymap.set('n','<a-l>',':bnext<Cr>')
keymap.set('n','<a-h>',':bprevious<Cr>')
keymap.set('n','<a-w>',':bp|bd #<Cr>')
