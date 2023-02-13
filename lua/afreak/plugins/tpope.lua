return {
    { "tpope/vim-unimpaired" },
    { "tpope/vim-dispatch",  cmd = { "Dispatch", "Focus", "Make", "Start" } },
    { "tpope/vim-repeat",    event = "BufReadPre" },
    { "tpope/vim-fugitive", cmd = { "G", "Git", "GBrowse" },
        dependencies = {
            "tpope/vim-rhubarb",
        },
    },
}
