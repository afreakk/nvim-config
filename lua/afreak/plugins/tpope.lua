return {
    { "afreakk/unimpaired-which-key.nvim" -- ,dir = "/home/afreak/coding/unimpaired-which-key.lua"
    , dependencies = { "tpope/vim-unimpaired" }
    , config = function()
        local wk = require("which-key")
        local uwk = require("unimpaired-which-key")
        wk.register(uwk.normal_mode)
        wk.register(uwk.normal_and_visual_mode, { mode = { "n", "v" } })
    end
    },
    {
        "tpope/vim-dispatch",
        cmd = { "Dispatch", "Focus", "Make", "Start" },
    },
    {
        "tpope/vim-repeat",
        event = "BufReadPre",
    },
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git", "GBrowse" },
        dependencies = {
            "tpope/vim-rhubarb",
        },
    },
}
