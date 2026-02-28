function playkeys(commands)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(commands, true, false, true), "n", false)
end

function get_dir_files(path)
	local files = {}
	local handle = vim.loop.fs_scandir(path)

	if handle then
		while true do
			local name, type = vim.loop.fs_scandir_next(handle)
			if not name then
				break
			end

			if type == "file" then
				table.insert(files, name)
			end
		end
	end
	return files
end

function get_dir_files_list(path, ext)
	local target = {}
	local files = get_dir_files(path)
	for id=1, #files do
		local file_ext = string.sub(files[id], #files[id]-(#ext-1), #files[id])
		if file_ext == ext then
			table.insert(target, files[id])
		end
	end
	return target
end

local opt = { noremap = true, silent = true}

--Explorer
vim.keymap.set("n", "<leader>v", vim.cmd.Ex, opts )
--Cu t
vim.keymap.set({"n", "v"}, "<C-c>", '"+ygvd',opts  )
--Copy
vim.keymap.set({"n", "v"}, "<C-c>", '"+y',opts  )
vim.keymap.set({"i"}, "<C-c>", '<Esc>g_v_"+y',opts  )
--Select All
vim.keymap.set({"n"}, "<C-a>", '<Esc>gg_vGg_', opts )

--Save
vim.keymap.set({"n","v"}, "<C-s>", ":w<CR>")

--Paste
vim.keymap.set({"n","v"}, "<C-v>", '"+p',opts  )
vim.keymap.set({"i"}, "<C-v>", '<Esc>"+p<Esc>a',opts  )

--Tabulation
vim.keymap.set("v", "<Tab>", ">gv",opts  )
vim.keymap.set("v", "<S-Tab>", "<gv",opts  )
vim.keymap.set("n", "<Tab>", "v>gv<Esc>",opts  )
vim.keymap.set("n", "<S-Tab>", "v<gv<Esc>",opts  )

--Move with arrows
vim.keymap.set({"n"}, "<A-Up>", "yyPjddk",opts  )
vim.keymap.set({"n"}, "<A-Up>", "yykkpjjddkk",opts  )
vim.keymap.set({"n"}, "<A-Down>", "yyjpkkddj",opts  )
vim.keymap.set({"v"}, "<A-Up", "ygvdkp",opts  )

--Better window movements
vim.keymap.set("n", "<C-w><C-Up>", "<C-w><Up>", opts  )
vim.keymap.set("n", "<C-w><C-Down>", "<C-w><Down>", opts  )
vim.keymap.set("n", "<C-w><C-Left>", "<C-w><Left>", opts  )
vim.keymap.set("n", "<C-w><C-Right>", "<C-w><Right>", opts  )

vim.keymap.set({"n", "v"}, "<leader>c", function()
	local ext = vim.fn.expand("%:e")
	local mode = vim.api.nvim_get_mode()["mode"]
	
	--Xaml Comments
	if ext == "xaml" then
		if mode == "n" then
			playkeys("_i<!--<Esc>g_a--><Esc>")
		elseif mode == "v" then
			playkeys("<Esc>`<_i<!--<Esc>`>g_a--><Esc>gv")
		end
	end
end )
