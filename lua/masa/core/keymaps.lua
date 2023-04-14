-- set leader key to space
vim.g.mapleader = " "
local opts = { silent = true }
local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]


-- DAP
keymap.set("n", "<leader>da", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap.set("n", "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap.set("n", "<leader>dz", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap.set("n", "<leader>dx", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap.set("n", "<leader>dj", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

keymap.set(
	"n",
	"<leader>dcc",
	"<cmd>lua require'telescope'.extensions.dap.commands{}<CR>",
	{ silent = true, noremap = true }
)
keymap.set(
	"n",
	"<leader>dlb",
	"<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>",
	{ silent = true, noremap = true }
)
keymap.set(
	"n",
	"<leader>dv",
	"<cmd>lua require'telescope'.extensions.dap.variables{}<CR>",
	{ silent = true, noremap = true }
)
keymap.set(
	"n",
	"<leader>df",
	"<cmd>lua require'telescope'.extensions.dap.frames{}<CR>",
	{ silent = true, noremap = true }
)

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
