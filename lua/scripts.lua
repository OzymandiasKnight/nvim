function playkeys(commands)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(commands, true, false, true), "n", false)
end

function focus()
	local hl = vim.api.nvim_get_hl(0, {name = "Normal"})
	local smear = require("smear_cursor")

	if (hl.bg) then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
		smear.disable = false
	else
		vim.api.nvim_set_hl(0, "Normal", { bg = "#000000"})
		smear.disable = true
	end
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

function replaceAsk()
    local pattern = vim.fn.input("Replace pattern : ")
    if pattern ~= "" then
		vim.fn.setreg('/', pattern)
		vim.opt.hlsearch = true
		vim.cmd("redraw")
		local replacement = vim.fn.input("Replace with : ")
        vim.cmd(":.,$s/"..pattern.."/"..replacement.."/gc")
    end
end

function cleanup_shada_tmp()
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
end


local opt = { noremap = true, silent = true}

function setComment()
	local ext = vim.fn.expand("%:e")
	local mode = vim.api.nvim_get_mode()["mode"]
	
	--Xaml Comments
	if ext == "xaml" or ext == "html" then
		if mode == "n" then
			playkeys("_i<!--<Esc>g_a--><Esc>")
		elseif mode == "v" then
			playkeys("<Esc>`<_i<!--<Esc>`>g_a--><Esc>gv")
		end
	end
	if ext == "py" then
		if mode == "n" then
			playkeys("_i#<Esc>")
		end
	end
	if ext == "c" then
		if mode == "n" then
			playkeys("_i//<Esc>")
		end
	end
end

--RunFile
vim.api.nvim_create_user_command("RunFile",function()
    local ext = vim.fn.expand("%:e")
	local name = vim.fn.expand("%")
    local path = vim.fn.expand("%:p:h")
    vim.cmd(":!cd " .. path)
    if ext == "cs" or ext == "xaml" then
        vim.cmd("!dotnet run")
        --vim.fn.jobstart({"dotnet", "run"}, {cwd = path, detach = false})
    elseif (ext == "c" or ext == "h") then
        local build_cmd = ""
		local files = get_dir_files_list(path,".c")
		for id=1, #files do
			build_cmd = build_cmd..files[id].." "
		end
		vim.cmd("!gcc -o prgm "..build_cmd)
        vim.fn.jobstart({"cmd.exe","/C","cd /d"..path.." && prgm.exe"}, {detach=true})
	elseif ext == "py" then
		vim.cmd("!python "..name)
	elseif ext == "tex" then
		playkeys("\\lv")
    else
        print("Cannot run file")
    end
end, {})

--OpenExplorer
vim.api.nvim_create_user_command("OpenExplorer", function()
	local path = vim.fn.expand('%:p:h')
	vim.cmd("cd " .. path)
	path = vim.fn.getcwd()
	vim.fn.jobstart({ "cmd.exe", "/C", "start", "explorer.exe", path}, {detach = true})
end, {})


