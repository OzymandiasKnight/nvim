local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup{
	defaults = {
		find_command = { "rg", "--files"},
		mappings = {
			i = {
				["<Esc>"] = require("telescope.actions").close,
			}
		}
	}
}

vim.keymap.set('n', '<leader>fg', function()
	builtin.live_grep({
		default_text = "<<<<<<<|=======|>>>>>>>",
		additional_args = {"--hidden"}
	})
end)


vim.keymap.set('n', '<leader>fc', function()
	builtin.live_grep()
end)

vim.opt.termguicolors = true


vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
