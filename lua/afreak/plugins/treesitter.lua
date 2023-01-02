return {
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
    { 'andymass/vim-matchup',
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
        event = "BufReadPost",

    },
    {
        "mfussenegger/nvim-treehopper",
        keys = {
            { "m", ":<C-U>lua require('tsht').nodes()<CR>", mode = { "o" }, desc = "treehopper expand selection" },
            { "m", ":lua require('tsht').nodes()<CR>", mode = { "x" }, desc = "treehopper expand selection" },
        },
        config = function()
            require("tsht").config.hint_keys = { "a", "r", "s", "t", "d", "h", "n", "e", "i", "o" }
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "BufReadPost",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            'p00f/nvim-ts-rainbow'
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                matchup = {
                    enable = true, -- mandatory, false will disable the whole extension
                },
                ensure_installed = {
                    "c", "graphql", "javascript", "haskell", "nix", "bash", "fish", "elm", "lua", "go", "gomod",
                    "c_sharp", "html",
                    "jq", "json", "jsonnet", "markdown", "markdown_inline", "php", "python", "regex", "toml",
                    "typescript", "vim",
                    "yaml", "cmake", "comment", "css", "cpp", "diff", "dockerfile", "sql", "help"
                },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = false },
                rainbow = {
                    enable = true,
                    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-n>",
                        node_incremental = "<C-n>",
                        scope_incremental = "<C-s>",
                        node_decremental = "<C-r>",
                    },
                },

                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ['aa'] = '@parameter.outer',
                            ['ia'] = '@parameter.inner',
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',
                            ['ac'] = '@class.outer',
                            ['ic'] = '@class.inner',
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>a"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>A"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]]"] = "@function.outer",
                        },
                        goto_next_end = {
                            ["]["] = "@function.outer",
                        },
                        goto_previous_start = {
                            ["[["] = "@function.outer",
                        },
                        goto_previous_end = {
                            ["[]"] = "@function.outer",
                        },
                    },
                },
            })
        end,
    },
}
