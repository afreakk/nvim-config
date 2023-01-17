return {
    'chrisbra/Recover.vim',
    'dstein64/vim-startuptime',
    'tpope/vim-unimpaired',
    'tpope/vim-repeat',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    { 'direnv/direnv.vim', init = function()
        vim.g.direnv_auto = 0
    end },
    { 'echasnovski/mini.move', event = "VeryLazy", config = function()
        require('mini.move').setup({
            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                left = '<C-h>',
                right = '<C-l>',
                down = '<C-j>',
                up = '<C-k>',

                -- Move current line in Normal mode
                line_left = '<C-h>',
                line_right = '<C-l>',
                line_down = '<C-j>',
                line_up = '<C-k>',
            },
        })
    end },
    { "stevearc/dressing.nvim", event = "VeryLazy", config = function()
        require('dressing').setup({
            select = {
                backend = "fzf_lua",
            }
        })
    end },
    { "iamcco/markdown-preview.nvim", ft = "markdown", build = "cd app && yarn install" },
    { 'nfnty/vim-nftables', ft = "nftables" },
    { 'mbbill/undotree', cmd = "UndotreeToggle" },
    { 'jparise/vim-graphql', ft = "graphql" },
    { 'kevinhwang91/nvim-bqf', ft = "qf" },
    { 'cappyzawa/starlark.vim', ft = "starlark" },
    { 'chr4/nginx.vim', ft = { 'nginx' } },
    { 'LnL7/vim-nix', ft = "nix" },
    { 'lewis6991/gitsigns.nvim',
        event = "BufReadPre",
        config = function()
            require('gitsigns').setup({
                numhl = true,
                signcolumn = false,
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    map('n', ']h', function() vim.schedule(gs.next_hunk) return "<Ignore>" end,
                        { expr = true, desc = "next hunk" })
                    map('n', '[h', function() vim.schedule(gs.prev_hunk) return "<Ignore>" end,
                        { expr = true, desc = "prev hunk" })
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "hunk" })
                    -- rest of keys are set in which-key
                end
            })
        end,
    },
    { 'freitass/todo.txt-vim', ft = "todo" },
    { 'bronson/vim-visual-star-search', event = "BufReadPost" },
    {
        "gbprod/substitute.nvim",
        keys = {
            { "s", "<cmd>lua require('substitute').operator()<cr>",
                desc = "subtitute txt given by operator by register0" },
            { "ss", "<cmd>lua require('substitute').line()<cr>",
                desc = "substitute line by register0" },
            { "S", "<cmd>lua require('substitute').eol()<cr>",
                desc = "substitute to end of line by register0" },
            { mode = "x",
                "s", "<cmd>lua require('substitute').visual()<cr>",
                desc = "substitute visual selection by register0" },
            { "<leader>s", "<cmd>lua require('substitute.range').operator()<cr>",
                desc = "replace text defined by motion1 over range defined by motion2" },
            { mode = "x",
                "<leader>s", "<cmd>lua require('substitute.range').visual()<cr>",
                desc = "replace text defined by visual selection over range given by following motion" },
            { "<leader>ss", "<cmd>lua require('substitute.range').word()<cr>",
                desc = "replace word under cursor, in the range given by motion" },
        },
        config = function()
            require("substitute").setup()
        end
    },
    {
        "AckslD/nvim-neoclip.lua",
        event = "VeryLazy",
        config = function()
            require('neoclip').setup({
                -- doesnt support fzf, and probably not superuserfull for me
                enable_macro_history = false,
                filter = function(yankItem)
                    -- print(vim.inspect(yankItem))
                    -- dont save deleted stuff, they have their own register "1-9
                    return yankItem.event.operator ~= "d"
                end
            })
        end,
    },
    {
        "kylechui/nvim-surround",
        event = "BufReadPost",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert = "<C-g>s",
                    insert_line = "<C-g>S",
                    normal = "ys",
                    normal_cur = "yss",
                    normal_line = "yS",
                    normal_cur_line = "ySS",
                    visual = "S",
                    visual_line = "gS",
                    delete = "ds",
                    change = "cs",
                }
            })
        end
    },
    {
        'numToStr/Comment.nvim',
        event = "BufReadPost",
        config = function()
            require('Comment').setup()
        end
    },
    {
        'NvChad/nvim-colorizer.lua',
        event = "BufReadPre",
        config = function()
            require('colorizer').setup()
        end
    },
    { 'ethanholz/nvim-lastplace',
        event = "BufReadPre",
        config = function()
            require 'nvim-lastplace'.setup()
        end
    },
}
