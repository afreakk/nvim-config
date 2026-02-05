return {
    { 'mbbill/undotree',           cmd = "UndotreeToggle" },
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
    { 'bronson/vim-visual-star-search', event = "VeryLazy" },
    {
        'ethanholz/nvim-lastplace',
        event = "BufReadPost",
        config = true,
        name = "nvim-lastplace",
        opts = {
            lastplace_ignore_buftype = { "terminal" } }
    },
    { 'NvChad/nvim-colorizer.lua', event = "BufReadPre", config = true, name = "colorizer" },
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
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            filesystem = {
                follow_current_file = { enabled = true },
                hijack_netrw_behavior = "disabled",
            },
            window = {
                width = 30,
            },
        },
    },
}
