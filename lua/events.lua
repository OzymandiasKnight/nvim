--Auto cmds
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.tex",
  callback = function()
    vim.cmd("VimtexCompile")
  end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  pattern = "*.tex",
  callback = function()
    vim.cmd("VimtexStop")
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
		local shada_dir = vim.fn.stdpath('data') .. '/shada'
		local handle = vim.loop.fs_scandir(shada_dir)
		
		if handle then
			while true do
				local name, type = vim.loop.fs_scandir_next(handle)
				if not name then break end
				
				if type == "file" and name:match("%.tmp%.") then
					local filepath = shada_dir .. '/' .. name
					vim.loop.fs_unlink(filepath)
				end
			end
		end

		vim.schedule(function()
			  vim.cmd("NeovimProjectDiscover")
		end)
	end
})

vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    vim.defer_fn(function()
      if vim.fn.getcmdwintype() == "" then
        vim.cmd("Ex")
      end
    end, 100)
  end,
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "netrw",
	callback = function()
		vim.opt_local.number = true
		vim.opt_local.relativenumber = true
		vim.keymap.set("n", "gg", "9G", { buffer = true, silent = true})
		vim.keymap.set("n", "<Right>", "<Down>$", { buffer = true, silent = true})
		vim.keymap.set("n", "<Left>", "<Up>$", { buffer = true, silent = true})
	end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = "*",
	callback = function()
		vim.opt.titlestring = vim.fn.expand("<afile")
	end
})
