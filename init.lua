vim.opt.nu = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.whichwrap:append("<,>")

require("scripts")
require("events")
require("keymaps")
local function SwitchRelativeLines()
	vim.opt.nu = not vim.opt.nu
end

vim.api.nvim_set_hl(0, "Normal", { bg = "#000000"})


--Wichwrap

vim.cmd(':set title "."')
vim.g.netrw_list_hide = [[^\.\/$]]
vim.g.netrw_hide = 1


require("packer")
require("setup")
