vim.opt.nu = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.whichwrap:append("<,>")

require("scripts")
require("keymaps")
local function SwitchRelativeLines()
	vim.opt.nu = not vim.opt.nu
end

vim.api.nvim_set_hl(0, "Normal", { bg = "#000000"})


--Wichwrap
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "netrw",
	callback = function()
		vim.opt_local.number = true
		vim.opt_local.relativenumber = true
		vim.keymap.set("n", "gg", "9G", { buffer = true, silent = true})
	end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = "*",
	callback = function()
		vim.opt.titlestring = vim.fn.expand("<afile")
	end
})
vim.cmd(':set title "."')
vim.g.netrw_list_hide = [[^\.\/$]]
vim.g.netrw_hide = 1

vim.api.nvim_create_autocmd("VimEnter", {
    callback = cleanup_shada_tmp,
})

require("packer")
require("setup")
