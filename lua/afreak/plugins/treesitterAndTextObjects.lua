return {
    { 'michaeljsmith/vim-indent-object', event = "VeryLazy" },
    {
        'echasnovski/mini.ai',
        event = "VeryLazy",
        config = function()
            require('mini.ai').setup({
                custom_textobjects = {
                    -- use treesitter-textobjects instead of Function call
                    f = false,
                    -- rebind  function_call to F instead of f
                    F = require('mini.ai').gen_spec.function_call(),
                    -- use treesitter-textobjects instead of Argument
                    a = false,
                    -- rebind  argument to A instead of a
                    A = require('mini.ai').gen_spec.argument(),
                }
            })
        end
    },
    -- disabled: https://github.com/andymass/vim-matchup/issues/432
    -- {
    --     'andymass/vim-matchup',
    --     init = function()
    --         vim.g.matchup_matchparen_offscreen = { method = "popup" }
    --     end,
    -- },
    {
        'Wansmer/treesj',
        event = "VeryLazy",
        cmd = { "TSJJoin", "TSJSplit", "TSJToggle" },
        config = function()
            require('treesj').setup({
                use_default_keymaps = true,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        event = "BufReadPost",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
        },
        config = function()
            require("nvim-treesitter").setup({})
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    if pcall(vim.treesitter.start, args.buf) then
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
            -- Install parsers (async, skips already installed)
            require("nvim-treesitter").install({
                "c", "graphql", "javascript", "haskell", "nix", "bash", "fish", "elm", "lua", "go", "gomod",
                "c_sharp", "html", "fsharp",
                "jq", "json", "jsonnet", "markdown", "markdown_inline", "php",
                "python", "regex", "toml",
                "typescript", "vim", "vimdoc", "luadoc",
                "yaml", "cmake", "comment", "css", "cpp", "diff", "dockerfile", "sql"
            })

            -- Treesitter textobjects (new API: keymaps are set directly)
            local select = require("nvim-treesitter-textobjects.select")
            local swap = require("nvim-treesitter-textobjects.swap")
            local move = require("nvim-treesitter-textobjects.move")

            require("nvim-treesitter-textobjects").setup({
                select = { lookahead = true },
                move = { set_jumps = true },
            })

            -- Select
            for _, mapping in ipairs({
                { "aa", "@parameter.outer" },
                { "ia", "@parameter.inner" },
                { "af", "@function.outer" },
                { "if", "@function.inner" },
                { "ac", "@class.outer" },
                { "ic", "@class.inner" },
            }) do
                vim.keymap.set({ "x", "o" }, mapping[1], function()
                    select.select_textobject(mapping[2], "textobjects")
                end, { desc = mapping[2] })
            end

            -- Swap
            vim.keymap.set("n", "<leader>a", function() swap.swap_next("@parameter.inner") end, { desc = "Swap next parameter" })
            vim.keymap.set("n", "<leader>A", function() swap.swap_previous("@parameter.inner") end, { desc = "Swap prev parameter" })

            -- Move
            vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next function start" })
            vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_end("@function.outer", "textobjects") end, { desc = "Next function end" })
            vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev function start" })
            vim.keymap.set({ "n", "x", "o" }, "[]", function() move.goto_previous_end("@function.outer", "textobjects") end, { desc = "Prev function end" })
        end,
    },
}
