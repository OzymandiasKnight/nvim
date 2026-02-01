vim.lsp.config.csharp_ls = {
	cmd = { 'csharp-ls' },
	filetypes = { 'cs' },
	root_patterns = { 'csproj', "sln" }
}

vim.lsp.enable('csharp_ls')

vim.lsp.config.intelephense = {
	cmd = { "intelephense", "--stdio"},
	filetypes = { "php" },
	root_makers = {".git", "composer.json"}
}

vim.lsp.enable('intelephense')

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

