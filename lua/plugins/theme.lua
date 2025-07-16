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
        ["@type"] = { fg = "${yellow}" },
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

        ["@type.rust"] = { fg = "${yellow}" },
        ["@type.definition.rust"] = { fg = "${yellow}" },
        ["@constructor.rust"] = { fg = "${yellow}" },
        ["@type_identifier.rust"] = { fg = "${yellow}" },

        ["@type.typescript"] = { fg = "${red}" },
        ["@type.tsx"] = { fg = "${red}" },
        ["@type.javascript"] = { fg = "${red}" },
        ["@type.jsx"] = { fg = "${red}" },
        ["@constructor.typescript"] = { fg = "${red}" },
        ["@constructor.tsx"] = { fg = "${red}" },
        ["@constructor.javascript"] = { fg = "${red}" },
        ["@constructor.jsx"] = { fg = "${red}" },
        ["@variable.imported.typescript"] = { fg = "${red}" },
        ["@variable.imported.tsx"] = { fg = "${red}" },
        ["@variable.imported.javascript"] = { fg = "${red}" },
        ["@variable.imported.jsx"] = { fg = "${red}" },

        ["@constant.typescript"] = { fg = "${yellow}" },
        ["@constant.tsx"] = { fg = "${yellow}" },
        ["@constant.javascript"] = { fg = "${yellow}" },
        ["@constant.jsx"] = { fg = "${yellow}" },
        ["@variable.constant.typescript"] = { fg = "${yellow}" },
        ["@variable.constant.tsx"] = { fg = "${yellow}" },
        ["@variable.constant.javascript"] = { fg = "${yellow}" },
        ["@variable.constant.jsx"] = { fg = "${yellow}" },
      },
    }
    vim.cmd "colorscheme onedark_dark"
  end,
}
