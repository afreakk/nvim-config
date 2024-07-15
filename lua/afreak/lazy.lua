local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("boostrapping lazy")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)
require("lazy").setup("afreak.plugins", {
    defaults = { lazy = false },
    install = {
        colorscheme = { "gruvbox" },
        -- colorscheme = { "oxocarbon" },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchparen",
                "netrw",
                -- is needed to download spelllang
                -- "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "matchit",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    -- debug = true,
})
