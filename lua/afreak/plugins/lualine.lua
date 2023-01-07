return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'gruvbox',
      },
      sections = {
        lualine_a = { { 'mode' }, },
        lualine_b = { { 'diagnostics', sources = { 'coc' } } },
        lualine_x = {
          -- {
          --   require("noice").api.status.message.get_hl,
          --   cond = require("noice").api.status.message.has,
          -- },
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_z = { { 'filetype' }, },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'progress' },
        lualine_y = { 'location' },
        lualine_z = {}
      },
    })
  end
}
