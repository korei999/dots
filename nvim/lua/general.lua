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
