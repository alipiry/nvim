return {
  "gregorias/coerce.nvim",
  event = "VeryLazy",
  config = function()
    require("coerce").setup({
      notify = function(...)
        return vim.notify(...)
      end,
      lsp_rename_pattern = "*.rs,*.go,*.lua,*.js,*.jsx,*.ts,*.tsx,*.py,*.java,*.c,*.cpp,*.h,*.hpp",
      default_modes = {
        "camelCase",
        "PascalCase",
        "snake_case",
        "SCREAMING_SNAKE_CASE",
        "kebab-case",
        "SCREAMING-KEBAB-CASE",
      },
    })
    vim.keymap.set("n", "gsc", "<Plug>(CoerceCase)", { desc = "Coerce case" })
    vim.keymap.set("n", "gss", "<Plug>(CoerceSnake)", { desc = "Coerce to snake_case" })
    vim.keymap.set("n", "gsk", "<Plug>(CoerceKebab)", { desc = "Coerce to kebab-case" })
    vim.keymap.set("n", "gsp", "<Plug>(CoercePascal)", { desc = "Coerce to PascalCase" })
    vim.keymap.set("n", "gsa", "<Plug>(CoerceCamel)", { desc = "Coerce to camelCase" })
    vim.keymap.set("n", "gsS", "<Plug>(CoerceScreamingSnake)", { desc = "Coerce to SCREAMING_SNAKE_CASE" })
    vim.keymap.set("n", "gsK", "<Plug>(CoerceScreamingKebab)", { desc = "Coerce to SCREAMING-KEBAB-CASE" })
  end,
}
