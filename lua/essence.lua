local opts = { noremap = true, silent = true}

--Explorer
vim.keymap.set("n", "<leader>v", vim.cmd.Ex)
--Cut
vim.keymap.set({"n", "v"}, "<C-c>", '"+ygvd', opts)
--Copy
vim.keymap.set({"n", "v"}, "<C-c>", '"+y', opts )
vim.keymap.set({"i"}, "<C-c>", '<Esc>g_v_"+y', opts )

--Save
vim.keymap.set({"n","v"}, "<C-s>", ":w<CR>")
--Paste
vim.keymap.set({"n","v"}, "<C-v>", '"+p', opts )
vim.keymap.set({"i"}, "<C-v>", '<Esc>"+p<Esc>a', opts )

--Tabulation
vim.keymap.set("v", "<Tab>", ">gv", opts )
vim.keymap.set("v", "<S-Tab>", "<gv", opts )
vim.keymap.set("n", "<Tab>", "v>gv<Esc>", opts )
vim.keymap.set("n", "<S-Tab>", "v<gv<Esc>", opts )

--Move with arrows
vim.keymap.set({"n"}, "<A-Up>", "yykkpjjddkk", opts )
vim.keymap.set({"n"}, "<A-Down>", "yyjpkkddj", opts )
vim.keymap.set({"v"}, "<A-Up", "ygvdkp", opts )

--Better window movements
vim.keymap.set("n", "<C-w><C-Up>", "<C-w><Up>", opts)
vim.keymap.set("n", "<C-w><C-Down>", "<C-w><Down>", opts)
vim.keymap.set("n", "<C-w><C-Left>", "<C-w><Left>", opts)
vim.keymap.set("n", "<C-w><C-Right>", "<C-w><Right>", opts)
