return {
    { 'nmac427/guess-indent.nvim', config = true,         name = "guess-indent" },
    {
        's1n7ax/nvim-window-picker',
        lazy = true,
        config = true,
        name = "window-picker",
        opts = {
            selection_chars = 'ARSTDHNEIOQWUY' },
        version =
        'v1.*',
    },
    { "gbprod/substitute.nvim",         lazy = true,        config = true, name = "substitute", },
    {
        'NvChad/nvim-colorizer.lua',
        event = "BufReadPre",
        name = "colorizer",
        opts = {
            options = { parsers = { css = true } },
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        event = "BufReadPre",
        config = true,
        name = "gitsigns",
        opts = {
            numhl = true, signcolumn = false, }
    },
    {
        'direnv/direnv.vim',
        event = 'DirChangedPre',
        init = function()
            vim.g.direnv_auto = 0
        end
    },
}
