return {
  { 'antoinemadec/coc-fzf',
    dependencies = {
      { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } }
    },
    event = "VeryLazy" },
  { 'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
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
  },
}
