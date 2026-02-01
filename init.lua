vim.opt.nu = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8

require("essence")

vim.api.nvim_create_user_command("OpenExplorer", function()
	local path = vim.fn.expand('%:p:h')
	vim.fn.jobstart({ "cmd.exe", "/C", "start", "explorer.exe", path}, {detach = true})
end, {})

local function SwitchRelativeLines()
	vim.opt.nu = not vim.opt.nu
end

vim.keymap.set("n", "<C-e>", "<cmd>OpenExplorer<CR>", { noremap = true, silent = true})


--Wichwrap
vim.opt.whichwrap:append("<,>")

vim.api.nvim_create_user_command("RunFile", function()
	local ext = vim.fn.expand("%:e")
	local path = vim.fn.expand("%:p:h")
	if ext == "cs" then
    	vim.fn.jobstart({"dotnet", "run"}, {cwd = path, detach = false})
	else
        print("Cannot run file")
    end
end, {})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "netrw",
	callback = function()
		vim.opt_local.number = true
		vim.opt_local.relativenumber = true
	end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = "*",
	callback = function()
		vim.opt.titlestring = vim.fn.expand("<afile")
	end
})
vim.cmd(':set title "a"')


require("packer")
