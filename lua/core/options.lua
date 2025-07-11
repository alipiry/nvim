vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.o.wrap = true
vim.o.linebreak = true
vim.o.mouse = "a"
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 1
vim.o.backspace = "indent,eol,start"
vim.opt.laststatus = 3
vim.o.cmdheight = 0
vim.opt.termguicolors = true
vim.opt.showtabline = 2
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd("Alpha")
		end
	end,
})
vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.hover()
	end,
})
vim.api.nvim_create_autocmd("CursorHoldI", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.signature_help()
	end,
})
