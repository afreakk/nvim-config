require('afreak.helper-functions')
vim.g.gruvbox_contrast_dark="hard"
vim.cmd("colorscheme gruvbox")

if cmdAndGetFirstLine("hostname") == "hanstop" then
  vim.api.nvim_set_option("background", "dark")
else
  vim.api.nvim_set_option("background", "dark")
end
