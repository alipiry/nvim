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
o.backspace = "indent,eol,start"
o.cmdheight = 0
opt.laststatus = 3
opt.termguicolors = true
opt.showtabline = 2
opt.colorcolumn = "80"
opt.history = 1000
opt.ruler = true
opt.magic = true
opt.showmatch = true
opt.matchtime = 2
opt.errorbells = false
opt.visualbell = false
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.textwidth = 160

opt.undofile = true
opt.undolevels = 10000
opt.undoreload = 10000
opt.undodir = vim.fn.stdpath "data" .. "/undo"

opt.completeopt = {
  "menu",
  "menuone",
  "noselect",
  "noinsert",
}

vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.fn.mkdir(vim.fn.stdpath "data" .. "/undo", "p")

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
