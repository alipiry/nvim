return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    require("onedarkpro").setup {
      highlights = {
        ["@tag.builtin"] = { fg = "${red}" },
        ["@tag.html"] = { fg = "${red}" },
        ["@tag"] = { fg = "${yellow}" },

        ["@constructor"] = { fg = "${yellow}" },
        ["@type"] = { fg = "${red}" },
        ["@type.builtin"] = { fg = "${yellow}" },

        ["@keyword.import"] = { fg = "${purple}" },
        ["@keyword.export"] = { fg = "${purple}" },
        ["@keyword.from"] = { fg = "${purple}" },
        ["@keyword.function"] = { fg = "${purple}" },
        ["@keyword.default"] = { fg = "${purple}" },
        ["@keyword.return"] = { fg = "${purple}" },
        ["@keyword.conditional"] = { fg = "${purple}" },
        ["@keyword.repeat"] = { fg = "${purple}" },

        ["@variable"] = { fg = "${red}" },
        ["@variable.parameter"] = { fg = "${red}" },
        ["@variable.member"] = { fg = "${red}" },
        ["@variable.builtin"] = { fg = "${red}" },
        ["@variable.imported"] = { fg = "${red}" },
        ["@function.call"] = { fg = "${blue}" },
        ["@function"] = { fg = "${blue}" },
        ["@method.call"] = { fg = "${blue}" },
        ["@method"] = { fg = "${blue}" },

        ["@tag.attribute"] = { fg = "${red}" },
        ["@property"] = { fg = "${red}" },
        ["@field"] = { fg = "${red}" },

        ["@string"] = { fg = "${green}" },
        ["@string.regexp"] = { fg = "${green}" },
        ["@string.escape"] = { fg = "${green}" },
        ["@character"] = { fg = "${green}" },

        ["@string.go"] = { fg = "${green}" },
        ["@string.import.go"] = { fg = "${green}" },
        ["@type.definition.go"] = { fg = "${yellow}" },
      },
    }
    vim.cmd "colorscheme onedark_dark"
  end,
}
