-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
vim.opt.runtimepath:prepend(lazypath)
require("lazy").setup({
	--Colorscheme
	{
		"rose-pine/neovim",
		name="rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	},
	--Tab switching
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	--Auto completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
		}
	}
})
require("lsp")
require("setup_harpoon")
