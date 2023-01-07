return {
  {
    "gbprod/yanky.nvim",
    event = "BufReadPost",
    keys = {
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "yank" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "put after" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "put before" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "put after, leave cursors after" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "put before, leave cursor after" },
      { "<c-n>", "<Plug>(YankyCycleForward)", mode = "n", desc = "cycle forward (yankring)" },
      { "<c-p>", "<Plug>(YankyCycleBackward)", mode = "n", desc = "cycle backward (yankring)" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", mode = "n", desc = "put after line" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", mode = "n", desc = "put before line" },

      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", mode = "n", desc = "put after line +indent" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", mode = "n", desc = "put after line -indent" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", mode = "n", desc = "put before line +indent" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", mode = "n", desc = "put before line -indent" },

      { "=p", "<Plug>(YankyPutAfterFilter)", mode = "n", desc = "put after line =indent" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", mode = "n", desc = "put before line =indent" },
    },
    config = function()
      require("yanky").setup({
        highlight = {
          on_put = true,
          on_yank = true,
          timer = 150,
        },
      })
    end
  },
  {
    "gbprod/substitute.nvim",
    keys = {
      { "<space>s", "<cmd>lua require('substitute').operator()<cr>",
        desc = "subtitute txt given by operator by register0" },
      { "<space>ss", "<cmd>lua require('substitute').line()<cr>", desc = "substitute line by register0" },
      { "<space>S", "<cmd>lua require('substitute').eol()<cr>", desc = "substitute to end of line by register0" },
      { "<space>s", "<cmd>lua require('substitute').visual()<cr>", mode = "x",
        desc = "substitute visual selection by register0" },
      { "<leader>s", "<cmd>lua require('substitute.range').operator()<cr>",
        desc = "replace text defined by motion1 over range defined by motion2" },
      { "<leader>s", "<cmd>lua require('substitute.range').visual()<cr>", mode = "x",
        desc = "replace text defined by visual selection over range given by following motion" },
      { "<leader>ss", "<cmd>lua require('substitute.range').word()<cr>" },
    },
    config = function()
      require("substitute").setup({
        on_substitute = require("yanky.integration").substitute(),
        yank_substituted_text = false,
        range = {
          prefix = "s",
          prompt_current_text = false,
          confirm = false,
          complete_word = false,
          motion1 = false,
          motion2 = false,
          suffix = "",
        },
        exchange = {
          motion = false,
          use_esc_to_cancel = true,
        },
      })
    end
  }
}
