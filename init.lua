vim.g.mapleader = ";"
vim.g.maplocalleader = '\\'

require("afreak.lazy")
require("afreak.options")
-- Maybe i shoudnt use fis..
-- I dont use terminal in vim anyways
-- vim.o.shell = "/usr/bin/env fish"
vim.o.spelllang = "nb,en"
require("afreak.autocmds")
