local opt = vim.opt
local o = vim.o
local api = vim.api

opt.number = true
opt.clipboard = "unnamedplus"
o.wrap = true
o.linebreak = true
o.mouse = "a"
o.autoindent = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.fileencoding = "utf-8"
o.cmdheight = 1
o.backspace = "indent,eol,start"
opt.laststatus = 3
o.cmdheight = 0
opt.termguicolors = true
opt.showtabline = 2

api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd "Alpha"
    end
  end,
})

api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.hover()
  end,
})

api.nvim_create_autocmd("CursorHoldI", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.signature_help()
  end,
})
