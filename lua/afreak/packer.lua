vim.g.vimsyn_embed = 'l'
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

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
use 'tpope/vim-surround'
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
  'shadmansaleh/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true},
  config = function()
    require('lualine').setup({
      options = {theme = 'gruvbox'},
      sections = {
        lualine_a = {'coc#status', 'mode'}
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
use 'beeender/Comrade'
end)
