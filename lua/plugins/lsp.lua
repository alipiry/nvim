return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    local lspconfig = require "lspconfig"
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local ok, blink = pcall(require, "blink.cmp")
    if ok then
      capabilities = blink.get_lsp_capabilities(capabilities)
    end
    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      local key = vim.keymap.set
      key("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
      key("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
      key("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
      key("n", "K", vim.lsp.buf.hover, opts)
      key("n", "[d", vim.diagnostic.goto_prev, opts)
      key("n", "]d", vim.diagnostic.goto_next, opts)
      key("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      key("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end
    local servers = { "html", "cssls", "rust_analyzer", "lua_ls", "tailwindcss", "ts_ls", "gopls" }
    for _, server in ipairs(servers) do
      local server_config = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      if server == "lua_ls" then
        server_config.settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        }
      elseif server == "gopls" then
        server_config.settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
            gofumpt = true,
          },
        }
      end
      lspconfig[server].setup(server_config)
    end
    vim.diagnostic.config {
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    }
  end,
}
