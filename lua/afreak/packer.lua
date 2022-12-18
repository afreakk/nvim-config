local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
vim.g.vimsyn_embed = 'l'

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'mrjones2014/legendary.nvim', config = function()
        require('legendary').setup({
            which_key = {
                auto_register = true
            }
        })
    end }
    use { 'stevearc/dressing.nvim' }
    use { 'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    }
    use { "iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install" }
    use { "afreakk/coc-cspell-dicts", run = 'yarn install && yarn build' }

    use { 'nfnty/vim-nftables', ft = "nftables" }
    -- use { 'ionide/Ionide-vim',
    --   config = function()
    --     vim.g["fsharp#backend"] = "disable"
    --   end
    --   --, run = 'make fsautocomplete'}
    -- }

    use { 'sindrets/winshift.nvim', config = function()
        require("afreak.winshift")
    end
    }
    use { 'ibhagwan/smartyank.nvim',
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
    }
    use { 'mbbill/undotree',
        config = function()
            -- vim.g.undotree_DiffCommand = "delta"
        end
    }
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
    use { 'sbulav/nredir.nvim', cmd = "Nredir" }
    use { 'svermeulen/vim-subversive',
        config = function()
            vim.keymap.set("n", "<space>s", "<plug>(SubversiveSubstitute)", { noremap = true })
            vim.keymap.set("n", "<space>ss", "<plug>(SubversiveSubstituteLine)", { noremap = true })
            vim.keymap.set("n", "<space>S", "<plug>(SubversiveSubstituteToEndOfLine)", { noremap = true })
        end
    }
    use { 'jparise/vim-graphql', ft = "graphql" }

    use { 'kevinhwang91/nvim-bqf', ft = "qf" }
    -- use 'rmagatti/auto-session'
    use { 'cappyzawa/starlark.vim', ft = "starlark" }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- disable until it does not cause error in elm files
    -- use { 'RRethy/nvim-treesitter-textsubjects' }
    use { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'p00f/nvim-ts-rainbow'

    use { 'chr4/nginx.vim', ft = { 'nginx' } }
    use { 'LnL7/vim-nix', ft = "nix" }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use { 'freitass/todo.txt-vim', ft = "todo" }
    use 'bronson/vim-visual-star-search'

    use 'wellle/targets.vim'
    use 'andymass/vim-matchup'

    use 'tpope/vim-unimpaired'
    use 'chrisbra/Recover.vim'
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use {
        "tpope/vim-surround",
        keys = { "c", "d", "y" },
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
    }
    use 'tpope/vim-repeat'
    -- use 'tpope/vim-commentary'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    }
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'junegunn/fzf'
    use { 'antoinemadec/coc-fzf', requires = { 'junegunn/fzf.vim' } }
    -- use 'junegunn/fzf.vim'
    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('fzf-lua').setup {
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
                    cmd = "git grep --recurse-submodules --line-number --color=auto --perl-regexp"
                }
            }
        end
    }
    use 'tpope/vim-fugitive'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
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
    }

    use { "ellisonleao/gruvbox.nvim", config = function()
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
    end }

    use 'tpope/vim-sleuth'
    use { 't9md/vim-choosewin',
        config = function()
            vim.g.choosewin_label = 'ARSTDHNEIOQWFPGJLUYZXCVBKM'
            vim.keymap.set("n", "<C-S>", "<Plug>(choosewin)")
        end
    }
    use 'tpope/vim-rhubarb'
    use { 'folke/which-key.nvim', config = function()
        require('afreak.space-maps')

    end }
    use 'michaeljsmith/vim-indent-object'
    -- use 'beeender/Comrade'
    if packer_bootstrap then
        require('packer').sync()
    end
end)
