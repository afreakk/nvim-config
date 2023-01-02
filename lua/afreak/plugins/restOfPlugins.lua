return {
    'dstein64/vim-startuptime',
    { 'mrjones2014/legendary.nvim', config = function()
        require('legendary').setup({
            which_key = {
                auto_register = true
            }
        })
    end, lazy = true },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
    { 'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    },
    { "iamcco/markdown-preview.nvim", ft = "markdown", build = "cd app && yarn install" },
    { "afreakk/coc-cspell-dicts", build = 'yarn install && yarn build' },

    { 'nfnty/vim-nftables', ft = "nftables" },
    -- { 'ionide/Ionide-vim',
    --   config = function()
    --     vim.g["fsharp#backend"] = "disable"
    --   end
    --   --, build = 'make fsautocomplete'}
    -- }

    { 'ibhagwan/smartyank.nvim',
        config = function()
            require('smartyank').setup {
                highlight = {
                    enabled = true, -- highlight yanked text
                    higroup = "IncSearch", -- highlight group of yanked text
                    timeout = 200, -- timeout for clearing the highlight
                },
                clipboard = {
                    enabled = true
                },
                tmux = {
                    enabled = false,
                },
                osc52 = {
                    enabled = false,
                }
            }
        end
    },
    { 'mbbill/undotree', cmd = "UndotreeToggle" },
    -- use {'glepnir/indent-guides.nvim',
    -- config = function()
    --   require('indent_guides').setup({
    --     indent_levels = 30;
    --     indent_guide_size = 1;
    --     indent_start_level = 1;
    --     indent_enable = false;
    --     indent_space_guides = true;
    --     indent_tab_guides = false;
    --     indent_soft_pattern = '\\s';
    --     exclude_filetypes = {'help','dashboard','dashpreview','NvimTree','vista','sagahover'};
    --     even_colors = { fg ='#0000FF',bg='#FF0000' };
    --     odd_colors = {fg='#FF00FF',bg='#00FF00'};
    --   })
    -- end
    -- }
    { 'sbulav/nredir.nvim', cmd = "Nredir" },
    { 'svermeulen/vim-subversive',
        keys = {
            { "<space>s", "<plug>(SubversiveSubstitute)", desc = "SubversiveSubstitute" },
            { "<space>ss", "<plug>(SubversiveSubstituteLine)", desc = "SubversiveSubstituteLine" },
            { "<space>S", "<plug>(SubversiveSubstituteToEndOfLine)", desc = "SubversiveSubstituteToEndOfLine" },
        },
    },
    { 'jparise/vim-graphql', ft = "graphql" },

    { 'kevinhwang91/nvim-bqf', ft = "qf" },
    -- use 'rmagatti/auto-session'
    { 'cappyzawa/starlark.vim', ft = "starlark" },

    { 'chr4/nginx.vim', ft = { 'nginx' } },
    { 'LnL7/vim-nix', ft = "nix" },
    { 'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end,
        event = "BufReadPre",
    },
    { 'freitass/todo.txt-vim', ft = "todo" },
    'bronson/vim-visual-star-search',
    'wellle/targets.vim',
    -- 'tpope/vim-unimpaired',
    'chrisbra/Recover.vim',
    {
        "tpope/vim-surround",
        config = function()
            -- https://github.com/ggandor/lightspeed.nvim/discussions/83
            vim.keymap.set("n", "ds", "<Plug>Dsurround")
            vim.keymap.set("n", "cs", "<Plug>Csurround")
            vim.keymap.set("n", "cS", "<Plug>CSurround")
            vim.keymap.set("n", "ys", "<Plug>Ysurround")
            vim.keymap.set("n", "yS", "<Plug>YSurround")
            vim.keymap.set("n", "yss", "<Plug>Yssurround")
            vim.keymap.set("n", "ySs", "<Plug>YSsurround")
            vim.keymap.set("n", "ySS", "<Plug>YSsurround")
            vim.keymap.set("x", "gs", "<Plug>VSurround")
            vim.keymap.set("x", "gS", "<Plug>VgSurround")
        end
    },
    'tpope/vim-repeat',
    -- use 'tpope/vim-commentary'
    {
        'numToStr/Comment.nvim',
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
    { 'neoclide/coc.nvim', branch = 'release', lazy = false },
    'tpope/vim-fugitive',
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        config = function()
            require('lualine').setup({
                options = { theme = 'gruvbox' },
                sections = {
                    lualine_a = { { 'mode' }, },
                    lualine_b = { { 'diagnostics', sources = { 'coc' } } },
                    lualine_x = { { 'filetype' }, },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'progress' },
                    lualine_y = { 'location' },
                    lualine_z = {}
                },
            })
        end
    },

    { "ellisonleao/gruvbox.nvim", config = function()
        -- setup must be called before loading the colorscheme
        -- Default options:
        require("gruvbox").setup({
            undercurl = true,
            underline = true,
            bold = true,
            italic = true,
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "hard", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false,
        })
        vim.cmd("colorscheme gruvbox")
    end },

    'tpope/vim-sleuth',
    { 't9md/vim-choosewin',
        config = function()
            vim.g.choosewin_label = 'ARSTDHNEIOQWFPGJLUYZXCVBKM'
            vim.g.choosewin_overlay_enable = 1
        end,
        keys = { { "<C-S>", "<Plug>(choosewin)", desc = "choosewin" } }
    },
    'tpope/vim-rhubarb',
    'michaeljsmith/vim-indent-object',
    -- use 'beeender/Comrade'
}
