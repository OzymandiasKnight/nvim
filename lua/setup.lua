require("smear_cursor").setup({
	stiffness = 0.8,
	trailing_stiffness = 0.5,
	distance_stop_animating = 0.5,
	cursor_color = "#ffffff"
})

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
	})
end)

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
