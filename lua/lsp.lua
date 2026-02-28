--Servers setup
lsp_list = {'csharp', 'php', 'python', 'c'}

for lsp_id = 1, #lsp_list do
	local lsp_name = lsp_list[lsp_id]
	local lsp_config = require('lsp.'..lsp_name)
	vim.lsp.config(lsp_name, lsp_config)
	vim.lsp.enable(lsp_name)
end


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

