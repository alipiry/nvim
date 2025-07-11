return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local blink = require("blink-cmp")
    local lspkind = require("lspkind")
    local devicons = require("nvim-web-devicons")
    blink.setup({
      keymap = {
        preset = "none",
        ["<C-l>"] = { "show" },
        ["<Tab>"] = { "select_next" },
        ["<S-Tab>"] = { "select_prev" },
        ["<CR>"] = { "accept" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = {
        implementation = "prefer_rust",
        sorts = {
          "exact",
          function(a, b)
            if
                (a.client_name == nil or b.client_name == nil)
                or (a.client_name == b.client_name)
            then
              return
            end
            return b.client_name == "emmet_ls"
          end,
          "score",
          "sort_text",
        },
      },
      completion = {
        keyword = { range = "full" },
        list = {
          selection = {
            preselect = false,
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        accept = {
          auto_brackets = { enabled = true },
        },
        menu = {
          max_height = 15,
          min_width = 20,
          draw = {
            treesitter = {
              "lsp",
            },
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = devicons.get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = lspkind.symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end
                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = devicons.get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
            },
          },
        },
      },
    })
  end,
}
