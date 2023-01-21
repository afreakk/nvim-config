vim.g.mapleader = ";"
vim.g.maplocalleader = '\\'

-- this needs 2 be before the other yank/paste binds
vim.keymap.set("n", 'Y', 'y$')

-- Yank/Paste from system clipboard mappings
for _, value in pairs({ 'p', 'P', 'y', 'Y' }) do
    vim.keymap.set({ 'n', 'v' }, '<leader>' .. value, '"+' .. value, { remap = true })
end

require("afreak.lazy")
require("afreak.options")
-- Maybe i shoudnt use fis..
-- I dont use terminal in vim anyways
-- vim.o.shell = "/usr/bin/env fish"
vim.o.spelllang = "nb,en"
require("afreak.autocmds")
