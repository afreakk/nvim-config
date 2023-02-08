return {
    { 'echasnovski/mini.sessions', version = false, config = function()
        require('mini.sessions').setup({ file = "", autowrite = true, autoread = false })
    end },
    { 'echasnovski/mini.starter', version = false, config = function()
        require('mini.starter').setup()
    end },
    { 'nyoom-engineering/oxocarbon.nvim', priority = 1000, lazy = true },
    { "ellisonleao/gruvbox.nvim", priority = 1000, lazy = false, config = function()
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
    {
        event = "VeryLazy",
        'nanozuki/tabby.nvim',
        config = function()
            require('tabby.tabline').set(function(line)
                return {
                    line.tabs().foreach(function(tab)
                        local tabClr = tab.is_current() and 'GruvboxOrangeSign' or 'WinBarNC'
                        local bgClr = "Normal"
                        return {
                            line.sep('', tabClr, bgClr),
                            tab.number(),
                            tab.name(),
                            line.sep('', tabClr, bgClr),
                            hl = tabClr,
                            margin = ' ',
                        }
                    end),
                    hl = 'WinBarNC',
                }
            end)
        end
    },
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
                    lualine_a = { { 'mode' } },
                    lualine_b = { { 'diagnostics', sources = { 'coc' } } },
                    lualine_c = { { function()
                        if string.match(vim.env.SSH_AUTH_SOCK, "trezor") then
                            return ""
                        end
                        return ""
                    end } },
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
                        {
                            noice.api.status.ruler.get,
                            cond = noice.api.status.ruler.has,
                        },
                    },
                    lualine_z = { { 'location' }, { 'filetype' }, },
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
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    -- dont thinktthis is necessary as i use coc.nvim, but
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
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
