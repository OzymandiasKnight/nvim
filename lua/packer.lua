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
	--Github
	{
		"tpope/vim-fugitive"	
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			smear_insert_mode = false,
			stiffness = 0.8,
			trailing_stiffness = 0.5,
			distance_stop_animating = 0.5,
			cursor_color = "#ffffff"
		}
	},
	--Latex
	{
		"lervag/vimtex",
		version = "*",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "general"
			vim.g.vimtex_view_general_viewer = "C:/Users/ozyma/AppData/Local/SumatraPDF/SumatraPDF.exe"
			vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
			vim.g.vimtex_view_general_options_latexmk = "-reuse-instance -forward-search @tex @line @pdf"
		end,
	}
})

vim.filetype.add({
  extension = { xaml = "xml" },
})

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

require("smear_cursor").setup({
	stiffness = 0.8,
	trailing_stiffness = 0.5,
	distance_stop_animating = 0.5,
	cursor_color = "#ffffff"
})

require("lsp")
require("setup_harpoon")
require("undotree")
