-- install following packages:
-- yarn global add cspell vscode-langservers-extracted eslint_d rustywind @tailwindcss/language-server typescript-language-server
-- brew install ripgrep fd

require('impatient')

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end


vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

require('packer').startup(function(use)
  use 'lewis6991/impatient.nvim'
  use 'wbthomason/packer.nvim'
  use 'numToStr/Comment.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'navarasu/onedark.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'p00f/nvim-ts-rainbow'
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'unblevable/quick-scope'
  use 'gpanders/editorconfig.nvim'
  use 'tpope/vim-vinegar'
  use 'norcalli/nvim-colorizer.lua'
  use 'windwp/nvim-ts-autotag'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"
  use 'karb94/neoscroll.nvim'
  use {
    'appelgriebsch/surround.nvim',
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "akinsho/bufferline.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "moll/vim-bbye",
    after = "bufferline.nvim",
  }
end)

vim.o.hlsearch = true
vim.o.mouse = ''
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.cc = '80'
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.completeopt = 'menu,menuone,preview,noselect,noinsert'
vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.opt.showbreak = "↪ "
vim.opt.hidden = true
vim.opt.list = true
vim.opt.wrap = true
vim.opt.listchars:append("tab: ›")
vim.opt.listchars:append("nbsp:␣")
vim.opt.listchars:append("trail:·")
vim.opt.listchars:append("extends:⟩")
vim.opt.listchars:append("precedes:⟨")
vim.opt.cmdheight = 1
vim.g.noswapfile = true
vim.g.nobackup = true
vim.g.nowritebackup = true
vim.g.nowb = true
vim.g.netrw_liststyle = 3
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false

vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_matchit = 0
vim.g.loaded_matchparen = 0
vim.g.loaded_spec = 0

require('onedark').setup {
  style = 'warmer'
}

vim.cmd [[colorscheme onedark]]

require('lualine').setup()

require('Comment').setup()

require('gitsigns').setup()

require("bufferline").setup()

require("neoscroll").setup()

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = require('telescope.actions').close,
      },
    },
  },
}

require('telescope').load_extension 'fzf'

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
}

local lspconfig = require 'lspconfig'
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  client.resolved_capabilities.document_formatting = false
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'tsserver', 'html', 'cssls', 'jsonls', 'tailwindcss' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require('colorizer').setup {
  '*';
  css = { css = true; }
}

local luasnip = require 'luasnip'
require("luasnip.loaders.from_vscode").load()

local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  },
}

local null_ls = require('null-ls')
null_ls.setup({
    fallback_severity = vim.diagnostic.severity.INFO,
    sources = {
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.rustywind,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.cspell,
    },
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd([[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
        ]])
      end
    end,
})

local mapOpts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', mapOpts)
vim.api.nvim_set_keymap('n', '<leader>Q', ':q!<CR>', mapOpts)
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', mapOpts)
vim.api.nvim_set_keymap('n', '<leader>r', ':e<CR>', mapOpts)
vim.api.nvim_set_keymap('n', '<C-w><Left>', '<C-w>h', mapOpts)
vim.api.nvim_set_keymap('n', '<C-w><Down>', '<C-w>j', mapOpts)
vim.api.nvim_set_keymap('n', '<C-w><Up>', '<C-w>k', mapOpts)
vim.api.nvim_set_keymap('n', '<C-w><Right>', '<C-w>l', mapOpts)

vim.api.nvim_set_keymap('n', '<C-f>', [[<cmd>lua require('telescope.builtin').git_files{ previewer = false }<CR>]], mapOpts)
vim.api.nvim_set_keymap('n', '<C-s>', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], mapOpts)
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], mapOpts)
vim.api.nvim_set_keymap('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], mapOpts)

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', mapOpts)
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', mapOpts)
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>Bdelete<CR>', mapOpts)
