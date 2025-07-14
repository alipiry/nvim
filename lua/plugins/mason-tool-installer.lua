return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup {
      ensure_installed = {
        -- Lua
        "stylua",
        -- Rust
        "rustfmt",
        -- JavaScript/TypeScript
        "prettierd",
        "eslint_d",
        "goimports",
        "gofumpt",
        "shfmt",
        "shellcheck",
        "black",
        "isort",
        "pylint",
        "mypy",
        "yamllint",
        "jsonlint",
        "htmlhint",
        "stylelint",
        "markdownlint",
        "hadolint",
      },
      auto_update = false,
      run_on_start = true,
    }
  end,
}
