return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
		},
		window = {
			position = "left",
			width = 32,
		},
	},
	vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle left<CR>", { desc = "Toggle Neo-tree sidebar" }),
}
