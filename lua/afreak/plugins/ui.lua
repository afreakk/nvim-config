return {
    { 'nyoom-engineering/oxocarbon.nvim', priority = 1000, lazy = true },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = function()
        -- setup must be called before loading the colorscheme
        -- Default options:
        require("gruvbox").setup({
            undercurl = true,
            underline = true,
            bold = true,
            italic = true,
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = true,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "hard", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false,
        })
        vim.cmd([[colorscheme gruvbox]])
    end },
    { 'nanozuki/tabby.nvim', config = function()
        require('tabby.tabline').set(function(line)
            return {
                line.tabs().foreach(function(tab)
                    return {
                        line.sep('', 'TabLine', 'TabLineFill'),
                        tab.number(),
                        tab.name(),
                        line.sep('', 'TabLine', 'TabLineFill'),
                        hl = tab.is_current() and 'TabLineSel' or 'TabLine',
                        margin = ' ',
                    }
                end),
                hl = 'TabLineFill',
            }
        end)
    end },
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        config = function()
            local noice = require("noice")
            require('lualine').setup({
                options = {
                    theme = 'gruvbox',
                },
                sections = {
                    lualine_a = { { 'mode' }, },
                    lualine_b = { { 'diagnostics', sources = { 'coc' } } },
                    lualine_x = {
                        -- {
                        --   noice.api.status.message.get_hl,
                        --   cond = noice.api.status.message.has,
                        -- },
                        {
                            noice.api.status.command.get,
                            cond = noice.api.status.command.has,
                        },
                        {
                            noice.api.status.mode.get,
                            cond = noice.api.status.mode.has,
                        },
                        {
                            noice.api.status.search.get,
                            cond = noice.api.status.search.has,
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
    },
    {
        'folke/noice.nvim', config = function()
            local noice = require("noice")
            noice.setup({
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
            vim.keymap.set("c", "<S-Enter>", function()
                noice.redirect(vim.fn.getcmdline())
            end, { desc = "Redirect Cmdline" })
        end,
        dependencies =
        { -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
}
