require('monokai').setup { 
	palette = require('monokai').dark,
	italics = false,
}
vim.opt['number'] = true
vim.opt['relativenumber'] = true
vim.opt['smarttab'] = true
vim.opt['expandtab'] = false
vim.opt['tabstop'] = 4
vim.opt['shiftwidth'] = 4
vim.opt['hlsearch'] = false
vim.opt['hidden'] = true
vim.opt['clipboard'] = 'unnamedplus'
vim.opt['mouse'] = 'a'
vim.opt['swapfile'] = false
vim.opt['smartcase'] = true
vim.opt['guicursor'] = 'i:block'
vim.opt['cmdheight'] = 1

-- Persistent undo
vim.opt['undofile'] = true
vim.opt.undodir = os.getenv( "HOME" ) .. '/.cache/nvim/undo'
vim.opt['undolevels'] = 1000
vim.opt['undoreload'] = 10000

-- Stop comments on newline / ctrl-d for "delete"
vim.cmd([[
    autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufWinEnter * :set nowrap
    imap <C-D> <C-O>x
    nnoremap d "_d
    nnoremap D "_D
    vnoremap d "_d
]])

-- autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o
-- highlight Normal guibg=none
-- nnoremap x "_x

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
