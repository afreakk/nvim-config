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
}
