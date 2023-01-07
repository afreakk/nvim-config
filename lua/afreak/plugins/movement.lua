-- TODO: check out https://github.com/rlane/pounce.nvim if its nice
return {
    { 'ggandor/flit.nvim', config = function()
        require('flit').setup {}
    end },
    { 'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    },
    { 'ggandor/leap-spooky.nvim', config = function()
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
}
