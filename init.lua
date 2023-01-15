-- its nice seeing what will be replaced in preview window
vim.opt.inccommand = "split"

-- not sure what diff between screenline and line is, lets try screenline
vim.opt.cursorlineopt = "screenline"
vim.opt.cursorline = true

-- mouse support in all modes
vim.opt.mouse = 'a'

-- persistent undo across yeye
vim.opt.undofile = true

-- You can use \c to force a pattern to be case insensitive, or  \C to force a pattern to be case sensitive.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ignore case in command-line completion
vim.opt.wildignorecase = true

-- not sure, lets try without for a while
-- vim.opt.showmatch = true

vim.opt.relativenumber = true
vim.opt.numberwidth = 1

-- Automatically insert the current comment leader after hitting 'o' or
-- 'O' in Normal mode.  In case comment is unwanted in a specific place
-- use CTRL-U to quickly delete it. |i_CTRL-U|
vim.opt.formatoptions:append('o')

-- dont think i need this, I know what mode im in
vim.opt.showmode = false

-- https://www.reddit.com/r/vim/wiki/tabstop
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- dont really ever use this?, and might be a security issue
-- vim.opt.modeline = true

-- Enables 24-bit RGB color in the |TUI|.  Uses "gui" |:highlight|
-- attributes instead of "cterm" attributes. |guifg|
-- Requires an ISO-8613-3 compatible terminal.
vim.opt.termguicolors = true

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false
-- for REACT etc transpilers (probably not needed when backup is false?)
-- vim.opt.backupcopy = 'yes'

--not sure if this is releant when using noice
--its an old option
--Better display for messages
vim.opt.cmdheight = 2

-- don't give |ins-completion-menu| messages.
vim.opt.shortmess:append('c')

vim.o.shell = "/usr/bin/env fish"
vim.o.spelllang = "nb,en"

vim.opt.signcolumn = 'number'
vim.g.mapleader = ";"
vim.g.maplocalleader = '\\'

-- this needs 2 be before the other yank/paste binds
vim.keymap.set("n", 'Y', 'y$')

-- Yank/Paste from system clipboard mappings
for _, value in pairs({ 'p', 'P', 'y', 'Y' }) do
    vim.keymap.set({ 'n', 'v' }, '<leader>' .. value, '"+' .. value, { remap = true })
end

local utils = require("afreak.utils")

local terminalMappings = {
    ["<C-Up>"] = "<C-\\><C-N><C-w>h",
    ["<C-Down>"] = "<C-\\><C-N><C-w>j",
    ["<C-Left>"] = "<C-\\><C-N><C-w>k",
    ["<C-Right>"] = "<C-\\><C-N><C-w>l",
    ["<Space><Esc>"] = "<C-\\><C-n>"
}

local n_mappings = {
    -- move cursor between windows
    ["<C-Up>"] = "<C-W>k",
    ["<C-Down>"] = "<C-W>j",
    ["<C-Left>"] = "<C-W>h",
    ["<C-Right>"] = "<C-W>l",
    -- center cursor after scroll is sweet
    ["<C-d>"] = "<C-d>zz",
    ["<C-u>"] = "<C-u>zz"
}

utils.map('t', terminalMappings)
utils.map('n', n_mappings)

--expression mapping
vim.keymap.set('n', '<Esc>', function()
    vim.schedule(function()
        vim.cmd([[nohlsearch]])
        require('notify').dismiss()
    end)
    return "<Esc>"
end, { expr = true })

require("afreak.autocmds")
require("afreak.lazy")
