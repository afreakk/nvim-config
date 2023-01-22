-- TODO: check out https://github.com/rlane/pounce.nvim if its nice
return {
    {
        keys = { { "f", mode = { "n", "x" } }, { "F", mode = { "n", "x" } }, { "t", mode = { "n", "x" } },
            { "T", mode = { "n", "x" } } },
        'ggandor/flit.nvim', config = function()
            require('flit').setup()
        end
    },
    { 'ggandor/leap.nvim',
        lazy = true,
        config = function()
            local leap = require('leap')
            for k, v in pairs(leap.opts.safe_labels) do
                -- could be wanting to substitute, so thats not a safe label
                if v == "s" and v == "S" then
                    leap.opts.safe_labels[k] = nil
                end
            end
        end
    },
    {
        event = "VeryLazy",
        'ggandor/leap-spooky.nvim', config = function()
            require('leap-spooky').setup {
                affixes = {
                    -- These will generate mappings for all native text objects, like:
                    -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
                    -- Special line objects will also be added, by repeating the affixes.
                    -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
                    -- window.
                    -- You can also use 'rest' & 'move' as mnemonics.
                    remote   = { window = 'r', cross_window = 'R' },
                    magnetic = { window = 'm', cross_window = 'M' },
                },
                -- If this option is set to true, the yanked text will automatically be pasted
                -- at the cursor position if the unnamed register is in use.
                paste_on_remote_yank = false,
            }
        end
    },
    { 'echasnovski/mini.move', lazy = true, config = function()
        require('mini.move').setup({
            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = { left = '', right = '', down = '', up = '', line_left = '', line_right = '', line_down = '',
                line_up = '', },
        })
    end },
}
