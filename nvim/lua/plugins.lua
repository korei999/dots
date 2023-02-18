return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

	-- colorscheme
    use 'korei999/monokai.nvim'

    -- lsp/treesitter
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'nvim-treesitter/nvim-treesitter'

    -- completions
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    -- etc
    use 'akinsho/nvim-toggleterm.lua'
    use 'norcalli/nvim-colorizer.lua'
    use 'terrortylor/nvim-comment'
	use 'romgrk/barbar.nvim'
	use 'kylechui/nvim-surround'

end)
