require('colorizer').setup()

vim.g.highlightedyank_highlight_duration = 350
vim.g.choosewin_label = 'ARSTDHNEIOQWFPGJLUYZXCVBKM'
vim.g.any_jump_disable_default_keybindings = 1
vim.g.vimsyn_embed = 'l'
require('lualine').setup({
  options = {theme = 'gruvbox'},
  sections = {
    lualine_a = {'coc#status', 'mode'}
  }
})
