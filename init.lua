vim.opt.nu = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
--Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--Copy
vim.keymap.set("n", "<C-c>", '"+y', { noremap = true, silent = true})
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true})
--Save
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("v", "<C-s>", ":w<CR>")
--Paste
vim.keymap.set("n", "<C-v>", '"+p', { noremap = true, silent = true})
vim.keymap.set("v", "<C-v>", '"+p', { noremap = true, silent = true})
--Tabulation
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true})
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true})
--Move with arrows
vim.keymap.set("n", "<A-Up>", "yykkpjjddkk", { noremap = true, silent = true})
vim.keymap.set("n", "<A-Down>", "yyjpkkddj", { noremap = true, silent = true})
vim.keymap.set("v", "<A-Down>", "yyjpkkddj", { noremap = true, silent = true})

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
    if ext == "cs" then
        vim.cmd(":!dotnet run")
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


require("packer")
