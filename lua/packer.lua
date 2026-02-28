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
		},
	},
	{
		"jiaoshijie/undotree",
		opts = {},
		keys = {
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},
	{
		"tpope/vim-fugitive"	
	},
	{
	  "sphamba/smear-cursor.nvim",
	  opts = {},
	},

})

vim.filetype.add({
  extension = { xaml = "xml" },
})

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

require("smear_cursor").setup({
	stiffness = 0.8,
	trailing_stiffness = 0.5,
	distance_stop_animating = 0.5,
})

require("lsp")
require("setup_harpoon")
require("undotree")
