return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"akinsho/toggleterm.nvim",
	},
	keys = {
		{
			"<leader>gg",
			function()
				require("lazygit_toggle").toggle()
			end,
			desc = "Toggle Lazygit",
		},
	},
	config = function()
		vim.g.lazygit_floating_window_scaling_factor = 1.0
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
			float_opts = {
				border = "rounded",
			},
			on_open = function(term)
				vim.cmd("startinsert!")
			end,
		})
		local M = {}
		function M.toggle()
			lazygit:toggle()
		end

		package.loaded["lazygit_toggle"] = M
	end,
}
