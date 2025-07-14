return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "gopls",
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "pyright",
          "jsonls",
          "bashls",
          "yamlls",
          "dockerls",
          "marksman",
          "emmet_ls",
          "vimls",
        },
        automatic_installation = true,
      }
    end,
  },
}
