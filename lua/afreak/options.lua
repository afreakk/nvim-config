-- Its nice seeing what will be replaced in preview window
vim.opt.inccommand = "split"

-- Not sure what diff between screenline and line is, lets try screenline
vim.opt.cursorlineopt = "screenline"
vim.opt.cursorline = true

-- Mouse support in all modes
vim.opt.mouse = 'a'

-- Persistent undo across yeye
vim.opt.undofile = true

-- You can use \c to force a pattern to be case insensitive, or  \C to force a pattern to be case sensitive.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Ignore case in command-line completion
vim.opt.wildignorecase = true

-- had enough of swapfiles for a while, dont think they have ever saved me
vim.opt.swapfile = false

-- Not sure, lets try without for a while
-- vim.opt.showmatch = true

-- Both number and relativenumber at the same time
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

-- Have a title
vim.opt.title = true

-- Automatically insert the current comment leader after hitting 'o' or
-- 'O' in Normal mode.  In case comment is unwanted in a specific place
-- Use CTRL-U to quickly delete it. |i_CTRL-U|
vim.opt.formatoptions:append('o')

-- Dont think i need this, I know what mode im in
vim.opt.showmode = false

-- Https://www.reddit.com/r/vim/wiki/tabstop
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Dont really ever use this?, and might be a security issue
-- vim.opt.modeline = true

-- Enables 24-bit RGB color in the |TUI|.  Uses "gui" |:highlight|
-- Attributes instead of "cterm" attributes. |guifg|
-- Requires an ISO-8613-3 compatible terminal.
vim.opt.termguicolors = true

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- Delays and poor user experience
vim.opt.updatetime = 250

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false
-- For REACT etc transpilers (probably not needed when backup is false?)
-- vim.opt.backupcopy = 'yes'

-- Not sure if this is releant when using noice
-- Its an old option
-- Better display for messages
vim.opt.cmdheight = 2

-- Signcolumn takes so much horizontal space
vim.opt.signcolumn = 'number'

-- Don't give |ins-completion-menu| messages.
vim.opt.shortmess:append('c')

vim.o.spelllang = "nb,en"
