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

  use 'nfnty/vim-nftables'
  use { 'ionide/Ionide-vim',
    config = function()
      vim.g["fsharp#backend"] = "disable"
    end
    --, run = 'make fsautocomplete'}
  }

  use { 'sindrets/winshift.nvim', config = function()
    require("winshift").setup({
      highlight_moving_win = true, -- Highlight the window being moved
      focused_hl_group = "Visual", -- The highlight group used for the moving window
      moving_win_options = {
        -- These are local options applied to the moving window while it's
        -- being moved. They are unset when you leave Win-Move mode.
        wrap = false,
        cursorline = false,
        cursorcolumn = false,
        colorcolumn = "",
      },

      ---A function that should prompt the user to select a window.
      ---
      ---The window picker is used to select a window while swapping windows with
      ---`:WinShift swap`.
      ---@return integer? winid # Either the selected window ID, or `nil` to
      ---   indicate that the user cancelled / gave an invalid selection.
      window_picker = function()
        return require("winshift.lib").pick_window({
          -- A string of chars used as identifiers by the window picker.
          picker_chars = "ARSTDHNEIOQWFPGJLUYZXCVBKM",
          filter_rules = {
            -- This table allows you to indicate to the window picker that a window
            -- should be ignored if its buffer matches any of the following criteria.
            cur_win = true, -- Filter out the current window
            floats = true, -- Filter out floating windows
            filetype = {
              "NvimTree",
              "coc-explorer",
            }, -- List of ignored file types
            buftype = {
              "terminal",
              "quickfix",
            }, -- List of ignored buftypes
            bufname = {}, -- List of vim regex patterns matching ignored buffer names
          },
          ---A function used to filter the list of selectable windows.
          ---@param winids integer[] # The list of selectable window IDs.
          ---@return integer[] filtered # The filtered list of window IDs.
          filter_func = nil,
        })
      end,
    })
    -- Start Win-Move mode:
    vim.cmd("nnoremap <C-W><C-M> <Cmd>WinShift<CR>")
    vim.cmd("nnoremap <C-W>m <Cmd>WinShift<CR>")

    -- Swap two windows:
    vim.cmd("nnoremap <C-W>X <Cmd>WinShift swap<CR>")

    vim.cmd("nnoremap <S-Left> <Cmd>WinShift left<CR>")
    vim.cmd("nnoremap <S-Down> <Cmd>WinShift down<CR>")
    vim.cmd("nnoremap <S-Up> <Cmd>WinShift up<CR>")
    vim.cmd("nnoremap <S-Right> <Cmd>WinShift right<CR>")
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
  use 'stsewd/fzf-checkout.vim'
  use { 'sbulav/nredir.nvim', cmd = "Nredir" }
  use { 'svermeulen/vim-subversive',
    config = function()
      vim.keymap.set("n", "<space>s", "<plug>(SubversiveSubstitute)", { noremap = true })
      vim.keymap.set("n", "<space>ss", "<plug>(SubversiveSubstituteLine)", { noremap = true })
      vim.keymap.set("n", "<space>S", "<plug>(SubversiveSubstituteToEndOfLine)", { noremap = true })
    end
  }
  use 'jparise/vim-graphql'
  use 'kevinhwang91/nvim-bqf'
  -- use 'rmagatti/auto-session'
  use 'cappyzawa/starlark.vim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate graphql javascript haskell nix bash fish elm lua go'
  }
  use { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'p00f/nvim-ts-rainbow'

  use {
    'chr4/nginx.vim',
    ft = { 'nginx' },
  }

  use 'LnL7/vim-nix'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'freitass/todo.txt-vim'
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
      vim.cmd("nmap ds       <Plug>Dsurround")
      vim.cmd("nmap cs       <Plug>Csurround")
      vim.cmd("nmap cS       <Plug>CSurround")
      vim.cmd("nmap ys       <Plug>Ysurround")
      vim.cmd("nmap yS       <Plug>YSurround")
      vim.cmd("nmap yss      <Plug>Yssurround")
      vim.cmd("nmap ySs      <Plug>YSsurround")
      vim.cmd("nmap ySS      <Plug>YSsurround")
      vim.cmd("xmap gs       <Plug>VSurround")
      vim.cmd("xmap gS       <Plug>VgSurround")
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
  use 'junegunn/fzf.vim'
  use 'tpope/vim-fugitive'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        options = { theme = 'gruvbox' },
        sections = {
          lualine_a = { { 'mode' }, },
          lualine_b = { { 'diff' }, { 'diagnostics', sources = { 'coc' } } },
          lualine_x = { { 'filetype' }, },
        }
      })
    end
  }

  use { "npxbr/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }

  use 'tpope/vim-sleuth'
  use { 't9md/vim-choosewin',
    config = function()
      vim.g.choosewin_label = 'ARSTDHNEIOQWFPGJLUYZXCVBKM'
      vim.cmd("nmap <C-S> <Plug>(choosewin)")
    end
  }
  use 'tpope/vim-rhubarb'
  use 'folke/which-key.nvim'
  use 'michaeljsmith/vim-indent-object'
  -- use 'beeender/Comrade'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
