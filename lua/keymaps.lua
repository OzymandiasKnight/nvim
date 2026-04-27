local opts = { noremap = true, silent = true}
--Explorer
vim.keymap.set("n", "<leader>v", openFolder, opts)
vim.keymap.set("n", "<leader>xx" , "<cmd>:Vex<CR><C-w>50<iii<C-w>l<cmd>:Ex<CR>C", opts)

--Cut
--vim.keymap.set({"n", "v"}, "<C-c>", '"+ygvd', opts)

--Copy
vim.keymap.set({"v"}, "<C-c>", '"+y', opts)
vim.keymap.set({"i"}, "<C-c>", '<Esc>g_v_"+y', opts)
vim.keymap.set({"n"}, "<C-c>", 'g_v_"+y', opts)

--Increment
vim.keymap.set({"n"}, "<Space>+", '<C-a>', opts)
vim.keymap.set({"n"}, "<Space>-", '<C-x>', opts)

--Select All
vim.keymap.set({"n"}, "<C-a>", '<Esc>gg_vGg_', opts)

--Save
vim.keymap.set({"n","v"}, "<C-s>", ":w<CR>")
vim.keymap.set({"i"}, "<C-s>", "<Esc>:w<CR>a")
--Paste
vim.keymap.set({"n","v"}, "<C-v>", '"+p', opts)
vim.keymap.set({"i"}, "<C-v>", '<Esc>"+p<Esc>a', opts)

--Tabulation
vim.keymap.set("v", "<Tab>", ">gv", opts)
vim.keymap.set("v", "<S-Tab>", "<gv", opts)
vim.keymap.set("n", "<Tab>", "v>gv<Esc>", opts)
vim.keymap.set("n", "<S-Tab>", "v<gv<Esc>", opts)

--Move with arrows
vim.keymap.set({"n"}, "<A-Up>", "yyPjddk", opts)
vim.keymap.set({"n"}, "<A-Up>", "yykkpjjddkk", opts)
vim.keymap.set({"n"}, "<A-Down>", "yyjpkkddj", opts)
vim.keymap.set({"v"}, "<A-Up", "ygvdkp", opts)

--Better window movements
vim.keymap.set("n", "<C-w><C-Up>", "<C-w><Up>", opts)
vim.keymap.set("n", "<C-w><C-Down>", "<C-w><Down>", opts)
vim.keymap.set("n", "<C-w><C-Left>", "<C-w><Left>", opts)
vim.keymap.set("n", "<C-w><C-Right>", "<C-w><Right>", opts)

--Tabs
vim.keymap.set("n", "<leader>t", "<cmd>Texplore<CR>", opts)
vim.keymap.set("n", "<leader>T", "<cmd>bd<CR>", opts)
vim.keymap.set("n", "<Space><Space>", "gt", opts)
vim.keymap.set("n", "gt", "gT", opts)
vim.keymap.set("n", "gT", "gt", opts)

--Scripts
	--Explorer
vim.keymap.set("n", "<C-e>", "<cmd>OpenExplorer<CR>", opts)
	--Replace and ask
vim.keymap.set("n", "<leader>r", replaceAsk, opts)
	--Comment
vim.keymap.set({"n", "v"}, "<leader>c", setComment, opts)
	--Run code
vim.keymap.set({"n"}, "<F5>", "<cmd>RunFile<CR>", opts)

