-- TODO: check out https://github.com/rlane/pounce.nvim if its nice
return {
    {
        keys = {
            { "f", mode = { "n", "x" } },
            { "F", mode = { "n", "x" } },
            { "t", mode = { "n", "x" } },
            { "T", mode = { "n", "x" } }
        },
        'ggandor/flit.nvim', config = function()
        require('flit').setup()
    end
    },
    { 'ggandor/leap.nvim',
        lazy = true,
        config = function()
            require('leap').opts.safe_labels = vim.tbl_map(function(v)
                    if vim.tbl_contains({ "s", "S" }, v) then
                        return nil
                    end
                    return v
                end, require('leap').opts.safe_labels)
        end
    },
    {
        keys = {
            { "ir", desc = "Remote",                                   mode = "o" },
            { "ar", desc = "Remote",                                   mode = "o" },
            { "r",  desc = "Remote line",                              mode = "o" }, -- nothing else in group..
            { "rr", desc = "Remote line",                              mode = "o" },
            { "iR", desc = "Remote cross_window",                      mode = "o" },
            { "aR", desc = "Remote cross_window",                      mode = "o" },
            { "R",  desc = "Remote cross_window line",                 mode = "o" }, -- nothing else in group..
            { "RR", desc = "Remote cross_window line",                 mode = "o" },
            { "im", desc = "Magnetic",                                 mode = "o" },
            { "am", desc = "Magnetic",                                 mode = "o" },
            { "m",  desc = "Magnetic / Leap forward to",               mode = "o" }, -- also used by leap.nvim
            { "mm", desc = "Magnetic line",                            mode = "o" },
            { "iM", desc = "Magnetic cross_window",                    mode = "o" },
            { "aM", desc = "Magnetic cross_window",                    mode = "o" },
            { "M",  desc = "Magnetic cross_window / Leap backward to", mode = "o" }, -- also used by leap.nvim
            { "MM", desc = "Magnetic cross_window line",               mode = "o" },
        },
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
