return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup()
		vim.keymap.set("n", "<leader>/", function()
			require("Comment.api").toggle.linewise.current()
		end, { desc = "Toggle comment for current line" })
	end,
}
