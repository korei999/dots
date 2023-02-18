require'colorizer'.setup()

vim.api.nvim_set_keymap('n', '<Leader>cc', ':ColorizerToggle<CR>', { noremap = true, silent = true })
