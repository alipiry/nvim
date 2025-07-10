---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvchad",
}

M.treesitter = {
  ensure_installed = { "html", "javascript", "typescript", "tsx", "go" },
}

return M
