vim.lsp.config.csharp_ls = {
	cmd = { 'csharp-ls' },
	filetypes = { 'cs' },
	root_patterns = { 'csproj', "sln" }
}

vim.lsp.enable('csharp_ls')

local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert(),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" }
	},
})

