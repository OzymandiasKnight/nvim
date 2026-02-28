vim.opt.nu = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8

require("essence")

vim.api.nvim_create_user_command("OpenExplorer", function()
	local path = vim.fn.expand('%:p:h')
	vim.cmd("cd " .. path)
	path = vim.fn.getcwd()
	vim.fn.jobstart({ "cmd.exe", "/C", "start", "explorer.exe", path}, {detach = true})
end, {})

local function SwitchRelativeLines()
	vim.opt.nu = not vim.opt.nu
end

vim.keymap.set("n", "<C-e>", "<cmd>OpenExplorer<CR>", { noremap = true, silent = true})


--Wichwrap
vim.opt.whichwrap:append("<,>")

--RunFile
vim.api.nvim_create_user_command("RunFile",function()
    local ext = vim.fn.expand("%:e")
	local name = vim.fn.expand("%")
    local path = vim.fn.expand("%:p:h")
    vim.cmd(":!cd " .. path)
    if ext == "cs" then
        vim.cmd("!dotnet run")
        --vim.fn.jobstart({"dotnet", "run"}, {cwd = path, detach = false})
    elseif ext == "c" then
        local build_cmd = ""
		local files = get_dir_files_list(path,".c")
		for id=1, #files do
			build_cmd = build_cmd..files[id].." "
		end
		vim.cmd("!gcc -o prgm "..build_cmd)
        vim.cmd("!prgm.exe")
	elseif ext == "py" then
		print(name)
		vim.cmd("!python "..name)
    else
        print("Cannot run file")
    end
end, {})

vim.keymap.set("n", "<F5>", "<cmd>RunFile<CR>", {noremap = true})

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
