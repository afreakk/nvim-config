require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c", "graphql", "javascript", "haskell", "nix", "bash", "fish", "elm", "lua", "go", "gomod", "c_sharp", "html",
        "jq", "json", "jsonnet", "markdown", "markdown_inline", "php", "python", "regex", "toml", "typescript", "vim",
        "yaml", "cmake", "comment", "css", "cpp", "diff", "dockerfile", "sql", "help"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
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
    -- disable until it does not cause error in elm files
    -- textsubjects = {
    --     enable = true,
    --     prev_selection = ',', -- (Optional) keymap to select the previous selection
    --     keymaps = {
    --         ['.'] = 'textsubjects-smart',
    --         [';'] = 'textsubjects-container-outer',
    --         ['i;'] = 'textsubjects-container-inner',
    --     },
    -- },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-n>",
            node_incremental = "<C-n>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-r>",
        },
    },
}
