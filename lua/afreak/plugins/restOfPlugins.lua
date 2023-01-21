return {
    'chrisbra/Recover.vim',
    'dstein64/vim-startuptime',
    'tpope/vim-unimpaired',
    'tpope/vim-repeat',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    { 'direnv/direnv.vim', init = function() vim.g.direnv_auto = 0 end },
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
            })
        end,
    },
    { 'freitass/todo.txt-vim', ft = "todo" },
    { 'bronson/vim-visual-star-search', event = "BufReadPost" },
    {
        "gbprod/substitute.nvim",
        lazy = true,
        config = function()
            require("substitute").setup()
        end
    },
    {
        "AckslD/nvim-neoclip.lua",
        event = "VeryLazy",
        config = function()
            require('neoclip').setup({
                -- doesnt support fzf, and probably not superusefull for me
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
