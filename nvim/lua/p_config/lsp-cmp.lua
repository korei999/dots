local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require("cmp")

cmp.setup({

	-- ... Your other configuration ...

    mapping = {

        -- ... Your other mappings ...

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        -- ... Your other mappings ...
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp'	,keyword_length = 3},
        { name = 'buffer' 	,keyword_length = 2},
        { name = 'path' 	,keyword_length = 9},
    })
    -- ... Your other configuration ...
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer'  	,keyword_length = 2},
        { name = 'path' 	,keyword_length = 9},
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'cmdline' 	,keyword_length = 5},
		{ name = 'path' 	,keyword_length = 9},
		{ name = 'buffer'	,keyword_length = 2},
	})
})
