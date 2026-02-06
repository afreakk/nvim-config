return {
    'folke/which-key.nvim',
    dependencies = { { dir = "/home/afreak/coding/unimpaired-which-key.nvim" }, "echasnovski/mini.icons" },
    config = function()
        vim.o.timeoutlen = 500
        local wk = require('which-key')
        wk.setup({
            notify = false,
            show_keys = false,
            show_help = false,
            spelling = {
                -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                enabled = true,
                -- how many suggestions should be shown in the list?
                suggestions = 20,
            },
        })

        -- Convert old wk.register() dict format to new wk.add() array format
        -- Old: { key = { handler, "desc", [mode = ...] }, key2 = { name = "+group", ... } }
        -- New: { { "prefixkey", handler, desc = "desc", mode = ... }, ... }
        local function convert(mappings, prefix, default_mode)
            local specs = {}
            for key, value in pairs(mappings) do
                if key == "name" then
                    specs[#specs + 1] = { prefix, group = value:gsub("^%+", ""), mode = default_mode }
                elseif type(value) == "table" and value[1] ~= nil then
                    specs[#specs + 1] = { prefix .. key, value[1], desc = value[2], mode = value.mode or default_mode }
                elseif type(value) == "table" then
                    vim.list_extend(specs, convert(value, prefix .. key, default_mode))
                end
            end
            return specs
        end

        wk.add(require("unimpaired-which-key"))
        local mappings = require("afreak.mappings.other")
        wk.add(mappings.n_mappings)
        wk.add(convert(mappings.x_mappings, "", "x"))
        wk.add(convert(mappings.c_mappings, "", "c"))
        local leadermaps = require("afreak.mappings.leader")
        wk.add(convert(leadermaps.spaceMaps, " ", { "n", "v" }))
        wk.add(convert(leadermaps.leaderMaps, "<leader>", "n"))
        wk.add(convert(leadermaps.localLeaderMaps, "<localleader>", "n"))
        wk.add(convert(leadermaps.x_leaderMaps, "<localleader>", "x"))
    end
}
