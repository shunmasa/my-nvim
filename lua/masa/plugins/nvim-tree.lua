-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
	-- change folder arrow icons
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	-- 	git = {
	-- 		ignore = false,
	-- 	},
})
