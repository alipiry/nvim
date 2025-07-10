local lspconfig = require "nvchad.configs.lspconfig"

local servers = { "html", "cssls", "rust_analyzer", "lua_ls", "tailwindcss", "ts_ls", "gopls" }

vim.lsp.enable(servers, lspconfig.defaults)

require("lspconfig").gopls.setup {
  on_attach = lspconfig.on_attach,
  capabilities = lspconfig.capabilities,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      gofumpt = true,
    },
  },
}
