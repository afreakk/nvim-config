return {
    'folke/which-key.nvim',
    dependencies = { dir = "/home/afreak/coding/unimpaired-which-key.nvim" },
    config = function()
        vim.o.timeoutlen = 500
        local wk = require('which-key')
        wk.setup({
            show_keys = false,
            show_help = false,
            spelling = {
                -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                enabled = true,
                -- how many suggestions should be shown in the list?
                suggestions = 20,
            },
        })
        wk.add(require("unimpaired-which-key"))
        local mappings = require("afreak.mappings.other")
        wk.register(mappings.n_mappings, { mode = "n" })
        wk.register(mappings.x_mappings, { mode = "x" })
        wk.register(mappings.i_mappings, { mode = "i" })
        wk.register(mappings.c_mappings, { mode = "c" })
        local leadermaps = require("afreak.mappings.leader")
        wk.register(leadermaps.spaceMaps, { prefix = " ", mode = { "n", 'v' } })
        wk.register(leadermaps.leaderMaps, { prefix = '<leader>' })
        wk.register(leadermaps.localLeaderMaps, { prefix = '<localleader>' })
        wk.register(leadermaps.x_leaderMaps, { prefix = '<localleader>', mode = "x" })
    end
}
