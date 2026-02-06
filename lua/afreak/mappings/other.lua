local M = {}
local utils = require('afreak.utils.other')
local h = utils.functionHelper
local c = utils.cmd

-- v2 bindings,, trying this out, if i dont like it, uncomment the bindings below
M.n_mappings = {
    { "<C-Down>",   "<C-W>j",                             desc = "Navigate window down" },
    { "<C-Left>",   "<C-W>h",                             desc = "Navigate window left" },
    { "<C-Right>",  "<C-W>l",                             desc = "Navigate window right" },
    { "<C-Up>",     "<C-W>k",                             desc = "Navigate window up" },
    { "<C-W><C-M>", "<cmd>WinShift<CR>",                  desc = "WinShift (modal)" },
    { "<C-W>X",     "<cmd>WinShift swap<CR>",             desc = "WinShift swap" },
    { "<C-W>m",     "<cmd>WinShift<CR>",                  desc = "WinShift (modal)" },
    { "<C-d>",      "<C-d>zz",                            desc = "Scroll down" },
    { "<C-h>",      h('mini.move', 'move_line', 'left'),  desc = "Mini.move line left" },
    { "<C-j>",      h('mini.move', 'move_line', 'down'),  desc = "Mini.move line down" },
    { "<C-k>",      h('mini.move', 'move_line', 'up'),    desc = "Mini.move line up" },
    { "<C-l>",      h('mini.move', 'move_line', 'right'), desc = "Mini.move line right" },
    { "<C-u>",      "<C-u>zz",                            desc = "Scroll up" },
    {
        "<Esc>",
        function()
            vim.schedule(function()
                vim.cmd([[nohlsearch]])
                require("snacks.notifier").hide()
            end)
            return "<Esc>"
        end,
        desc = "dismiss",
        expr = true,
        replace_keycodes = true
    },
    { "<S-Down>",  "<cmd>WinShift down<CR>",  desc = "WinShift down" },
    { "<S-Left>",  "<cmd>WinShift left<CR>",  desc = "WinShift left" },
    { "<S-Right>", "<cmd>WinShift right<CR>", desc = "WinShift right" },
    { "<S-Up>",    "<cmd>WinShift up<CR>",    desc = "WinShift up" },
    {
        "K",
        function()
            local cw = vim.fn.expand('<cword>')
            if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
                vim.api.nvim_command('h ' .. cw)
            else
                vim.lsp.buf.hover()
            end
        end,
        desc = "Show documentation"
    },
    { "M",  h('leap', 'leap', { backward = true }), desc = "Leap backward to" },
    { "S",  h("substitute", "eol"),                 desc = "Substitute to end of line by register0" },
    { "[g", function() vim.diagnostic.goto_prev() end, desc = "Prev diagnostic entry" },
    {
        "[h",
        function()
            vim.schedule(require('gitsigns').prev_hunk)
            return "<Ignore>"
        end,
        desc = "Prev gitsigns-hunk"
    },
    { "[o",  group = "Enable/Show" },
    { "[oo", vim.cmd.lopen,                 desc = "Enable locationlist" },
    { "[oq", vim.cmd.copen,                 desc = "Enable quickfixlist" },
    { "]g",  function() vim.diagnostic.goto_next() end, desc = "Next diagnostic entry" },
    {
        "]h",
        function()
            vim.schedule(require('gitsigns').next_hunk)
            return "<Ignore>"
        end,
        desc = "Next gitsigns-hunk"
    },
    { "]o",  group = "Disable/Hide" },
    { "]oo", vim.cmd.lclose,               desc = "Disable locationlist" },
    { "]oq", vim.cmd.cclose,               desc = "Disable quickfixlist" },
    { "gD",  function() vim.lsp.buf.implementation() end, desc = "Show implementation" },
    { "gd",  function() vim.lsp.buf.definition() end,     desc = "Show definition" },
    {
        "gm",
        function()
            return { target_windows = require('leap.util').get_enterable_windows() }
        end,
        desc = "leap-cross-window"
    },
    { "gr",  function() vim.lsp.buf.references() end,       desc = "Show references" },
    { "gy",  function() vim.lsp.buf.type_definition() end, desc = "Show type definition" },
    { "m",   h('leap', 'leap', {}),               desc = "Leap forward to" },
    { "s",   h("substitute", "operator"),         desc = "Subtitute txt given by operator by register0" },
    { "ss",  h("substitute", "line"),             desc = "Substitute line by register0" },
    { "yo",  group = "Toggle" },
    { "yoo", "<cmd>UndotreeToggle<CR>",           desc = "Toggle undotree" },
    { "yoq", h('afreak.utils.other', 'qfToggle'), desc = "Toggle quickfixlist" },
}
M.x_mappings = {
    s = { h("substitute", "visual"), "Substitute visual selection by register0" },
    i = {
        h = { c("Gitsigns select_hunk"), "Gitsigns hunk", mode = { "o", "x" } },
    },
    m = { h('leap', 'leap', { offset = 1, inclusive_op = true, match_last_overlapping = true }), "Leap forward to / Magnetic", mode = { "o", "x" } },
    M = { h('leap', 'leap', { backward = true, match_last_overlapping = true }), "Leap backward to / Magnetic cross_window", mode = { "o", "x" } },
    x = { h('leap', 'leap', { offset = -1, inclusive_op = true }), "Leap forward till", mode = { "o", "x" } },
    X = { h('leap', 'leap', { offset = 2, backward = true }), "Leap backward till", mode = { "o", "x" } },
    ['<C-h>'] = { h('mini.move', 'move_selection', 'left'), "Mini.move selection left" },
    ['<C-l>'] = { h('mini.move', 'move_selection', 'right'), "Mini.move selection right" },
    ['<C-j>'] = { h('mini.move', 'move_selection', 'down'), "Mini.move selection down" },
    ['<C-k>'] = { h('mini.move', 'move_selection', 'up'), "Mini.move selection up" },
}

-- Insert mode completion keybindings are handled by blink.cmp (see lsp.lua)
M.i_mappings = {}
M.c_mappings = {
    ["<S-Enter>"] = { function() require("noice").redirect(vim.fn.getcmdline()) end, "Redirect Cmdline" }
}
return M
