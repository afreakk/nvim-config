return {
    {
        'antoinemadec/coc-fzf',
        dependencies = {
            { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } }
        },
        event = "VeryLazy"
    },
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = true,
        config = function()
            local fzfLua = require('fzf-lua')
            fzfLua.setup {
                previewers = {
                    builtin = {
                        extensions = {
                            ["png"] = { "ueberzug" },
                            ["jpg"] = { "ueberzug" },
                        },
                        ueberzug_scaler = "fit_contain",
                    }
                },
                git = {
                    files = {
                        cmd = "git ls-files --exclude-standard --recurse-submodules"
                    }
                },
                grep = {
                    cmd = "git grep --ignore-case --recurse-submodules --line-number --color=auto --perl-regexp"
                }
            }
            fzfLua.register_ui_select()
        end
    },
    {
        "aaronhallaert/advanced-git-search.nvim",
        cmd = { "AdvancedGitSearch" },
        config = function()
            require("advanced_git_search.fzf").setup {
                -- Insert Config here
            }
        end,
        dependencies = {
            "nvim-telescope/telescope.nvim",
            -- to show diff splits and open commits in browser
            "tpope/vim-fugitive",
            -- to open commits in browser with fugitive
            "tpope/vim-rhubarb",
            -- optional: to replace the diff from fugitive with diffview.nvim
            -- (fugitive is still needed to open in browser)
            -- "sindrets/diffview.nvim",
        },
    }
}
