return {
    'dstein64/vim-startuptime',
    { 'mrjones2014/legendary.nvim', config = function()
        require('legendary').setup({
            which_key = {
                auto_register = true
            }
        })
    end, lazy = true },
    { "stevearc/dressing.nvim", event = "VeryLazy", config = function()
        require('dressing').setup({
            select = {
                backend = "fzf_lua",
            }
        })
    end },
    { 'ggandor/flit.nvim', config = function()
        require('flit').setup {}
    end },
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
    -- { 'svermeulen/vim-subversive',
    --     keys = {
    --         { "<space>s", "<plug>(SubversiveSubstitute)", desc = "SubversiveSubstitute" },
    --         { "<space>ss", "<plug>(SubversiveSubstituteLine)", desc = "SubversiveSubstituteLine" },
    --         { "<space>S", "<plug>(SubversiveSubstituteToEndOfLine)", desc = "SubversiveSubstituteToEndOfLine" },
    --     },
    -- },
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
    { 'bronson/vim-visual-star-search', event = "BufReadPost" },
    -- 'tpope/vim-unimpaired',
    'chrisbra/Recover.vim',
    {
        -- maybe mini.surround or vim-sandwich instead
        'tpope/vim-surround',
        -- https://github.com/ggandor/lightspeed.nvim/discussions/83
        keys = {
            { "cs", "<Plug>Csurround", desc = "change surrounding #1 by #2" },
            { "ds", "<Plug>Dsurround", desc = "delete surrounding #1" },
            { "cS", "<Plug>CSurround", desc = "change surrounding #1 by #2 + new line" },
            { "ys", "<Plug>Ysurround", desc = "wraps #1 in #2 (surround)" },
            { "yS", "<Plug>YSurround", desc = "wraps #1 in #2 (surround) + new line" },
            { "yss", "<Plug>Yssurround", desc = "wraps line in #1 (surround)" },
            { "ySs", "<Plug>YSsurround", desc = "wraps line in #1 (surround) + new line" },
            { "ySS", "<Plug>YSsurround", desc = "wraps line in #1 (surround) + new line" },
            -- this conflicts with leap.nvim cross window, but should override it, and cross-window-leap wont usually be done in visual mode anyways?
            { "gs", "<Plug>VSurround", desc = "wraps visual selection in #1 (surround)", mode = "x" },
            { "gS", "<Plug>VgSurround", desc = "wraps visual selection in #1 (surround) + new line", mode = "x" },
        },
        init = function()
            vim.g.surround_no_mappings = 1
        end
    },
    'tpope/vim-repeat',
    -- use 'tpope/vim-commentary'
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
    { 'neoclide/coc.nvim', branch = 'release', lazy = false },
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    { 'ethanholz/nvim-lastplace', config = function()
        require 'nvim-lastplace'.setup {}
    end },

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

    -- 'tpope/vim-sleuth',
    -- { 't9md/vim-choosewin',
    --     config = function()
    --         vim.g.choosewin_label = 'ARSTDHNEIOQWFPGJLUYZXCVBKM'
    --         vim.g.choosewin_overlay_enable = 1
    --     end,
    --     keys = { { "<C-S>", "<Plug>(choosewin)", desc = "choosewin" } }
    -- },
    -- use 'beeender/Comrade'
}
