--Servers setup
local csharp = require('lsp.csharp')
vim.lsp.config('csharp-ls', csharp)
vim.lsp.enable('csharp-ls')

--Lsp Keymap
vim.keymap.set('n', '<leader>z', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '<leader>d', vim.lsp.buf.hover, { desc = 'Hover documentation' })

vim.o.signcolumn = 'yes'

local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({select = true})
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" }
	},
})

