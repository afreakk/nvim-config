vim.g.vimsyn_embed = 'l'
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'ggandor/lightspeed.nvim'
  use({ "iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install" })

  use {'ionide/Ionide-vim',
      config = function()
        vim.g["fsharp#backend"] = "disable"
      end
      --, run = 'make fsautocomplete'}
      }

  use {'mbbill/undotree',
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
  use {'sbulav/nredir.nvim', cmd = "Nredir"}
  use 'svermeulen/vim-subversive'
  use 'jparise/vim-graphql'
  use 'kevinhwang91/nvim-bqf'
  use 'rmagatti/auto-session'
  use 'cappyzawa/starlark.vim'
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate graphql javascript haskell nix bash fish elm lua go'
  }
use {'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle'}
use 'nvim-treesitter/nvim-treesitter-textobjects'
use 'p00f/nvim-ts-rainbow'

use {
  'chr4/nginx.vim',
  ft = {'nginx'},
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
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
use {
   "tpope/vim-surround",
   keys = {"c", "d", "y"},
   config = function ()
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
use 'tpope/vim-commentary'
use {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup()
  end
}
use {'neoclide/coc.nvim', branch = 'release'}
use 'junegunn/fzf'
use 'junegunn/fzf.vim'
use 'laher/fuzzymenu.vim'
use 'tpope/vim-fugitive'
use {
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true},
  config = function()
    require('lualine').setup({
      options = {theme = 'gruvbox'},
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'diff', {'diagnostics', sources = {'coc'}}},
        lualine_x = {'filetype'},
      }
    })
  end
}

use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

use 'tpope/vim-sleuth'
use {'t9md/vim-choosewin',
    config = function()
      vim.g.choosewin_label = 'ARSTDHNEIOQWFPGJLUYZXCVBKM'
    end
}
use 'tpope/vim-rhubarb'
use 'folke/which-key.nvim'
use 'michaeljsmith/vim-indent-object'
-- use 'beeender/Comrade'
end)
