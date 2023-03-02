require('monokai').setup { 
	palette = require('monokai'),
	italics = true,
}
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'
vim.opt.swapfile = false
vim.opt.smartcase = true
vim.opt.guicursor = 'i:block'
vim.opt.cmdheight = 1
vim.opt.scrolloff = 8;

-- Persistent undo
vim.opt.undofile = true
vim.opt.undodir = os.getenv( "HOME" ) .. '/.cache/nvim/undo'
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Stop comments on newline
vim.cmd([[
autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufWinEnter * :set nowrap
]])

-- nnoremap d "_d
-- autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o
-- highlight Normal guibg=none

vim.keymap.set("n", "d", "\"_d")
vim.keymap.set("n", "D", "\"_D")
vim.keymap.set("v", "d", "\"_d")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("i", "<C-D>", "<C-O>x")
