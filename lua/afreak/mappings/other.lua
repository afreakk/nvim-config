local M = {}
local utils = require('afreak.utils.other')
local h = utils.functionHelper
local c = utils.cmd
local p = utils.plug
M.n_mappings = {
    ["<C-W>"] = {
        ["<C-M>"] = { c("WinShift"), "WinShift (modal)" },
        m = { c("WinShift"), "WinShift (modal)" },
        X = { c("WinShift swap"), "WinShift swap" },
    },
    ["<S-Left>"] = { c("WinShift left"), "WinShift left" },
    ["<S-Down>"] = { function()
        if vim.fn["coc#float#has_scroll"]() == 1 then
            vim.fn["coc#float#scroll"](1, 1)
        else
            vim.cmd("WinShift down")
        end
    end, "WinShift/coc-float-scroll down" },
    ["<S-Up>"] = { function()
        if vim.fn["coc#float#has_scroll"]() == 1 then
            vim.fn["coc#float#scroll"](0, 1)
        else
            vim.cmd("WinShift up")
        end
    end, "WinShift/coc-float-scroll up" },
    ["<S-Right>"] = { c("WinShift right"), "WinShift right" },
    -- move cursor between windows
    ["<C-Up>"] = { "<C-W>k", "Navigate window up" },
    ["<C-Down>"] = { "<C-W>j", "Navigate window down" },
    ["<C-Left>"] = { "<C-W>h", "Navigate window left" },
    ["<C-Right>"] = { "<C-W>l", "Navigate window right" },
    ['<C-h>'] = { h('mini.move', 'move_line', 'left'), "Mini.move line left" },
    ['<C-l>'] = { h('mini.move', 'move_line', 'right'), "Mini.move line right" },
    ['<C-j>'] = { h('mini.move', 'move_line', 'down'), "Mini.move line down" },
    ['<C-k>'] = { h('mini.move', 'move_line', 'up'), "Mini.move line up" },
    -- center cursor after scroll is sweet
    ["<C-d>"] = { "<C-d>zz", "Scroll down" },
    ["<C-u>"] = { "<C-u>zz", "Scroll up" },
    g = {
        m = { h('leap', 'leap', function()
            return { target_windows = require('leap.util').get_enterable_windows() }
        end), "leap-cross-window" },
        y = { p("coc-type-definition"), "Show type definition" },
        r = { p("coc-references"), "Show references" },
        d = { p("coc-definition"), "Show definition" },
        D = { p("coc-implementation"), "Show implementation" },
    },
    y = {
        o = {
            name = "+Toggle",
            q = { h('afreak.utils.other', 'qfToggle'), "Toggle quickfixlist" },
            o = { c("UndotreeToggle"), "Toggle undotree" },
        },
    },
    ["<Esc>"] = {
        function()
            vim.schedule(function()
                vim.fn["coc#float#close_all"](1)
                vim.cmd([[nohlsearch]])
                require('notify').dismiss()
            end)
            return "<Esc>"
        end,
        "dismiss",
        expr = true,
        replace_keycodes = true
    },
    s = { h("substitute", "operator"), "Subtitute txt given by operator by register0" },
    ["ss"] = { h("substitute", "line"), "Substitute line by register0" },
    S = { h("substitute", "eol"), "Substitute to end of line by register0" },
    ["["] = {
        o = {
            name = "+Enable/Show",
            o = { vim.cmd.lopen, "Enable locationlist" },
            q = { vim.cmd.copen, "Enable quickfixlist" },
        },
        h = { function()
            vim.schedule(require('gitsigns').prev_hunk)
            return "<Ignore>"
        end, "Prev gitsigns-hunk",
            { expr = true } },
        g = { p("coc-diagnostic-prev"), "Prev coc-diagnostic entry" },
    },
    ["]"] = {
        o = {
            name = "+Disable/Hide",
            o = { vim.cmd.lclose, "Disable locationlist" },
            q = { vim.cmd.cclose, "Disable quickfixlist" },
        },
        h = { function()
            vim.schedule(require('gitsigns').next_hunk)
            return "<Ignore>"
        end, "Next gitsigns-hunk", { expr = true } },
        g = { p("coc-diagnostic-next"), "Next coc-diagnostic entry" },
    },
    m = { h('leap', 'leap', {}), "Leap forward to" },
    M = { h('leap', 'leap', { backward = true }), "Leap backward to" },
    K = { function()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
            vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
            vim.fn.CocActionAsync('doHover')
        else
            vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
    end, "Show documentation" },
}
M.x_mappings = {
    s = { h("substitute", "visual"), "Substitute visual selection by register0" },
    g = {
        M = { ":lua require('tsht').nodes()<CR>", "Treehopper expand selection" },
    },
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

local noTextBehindCursor = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

M.i_mappings = {
    ["<S-Down>"] = {
        function()
            if vim.fn["coc#float#has_scroll"]() == 1 then
                vim.fn["coc#float#scroll"](1, 1)
            else
                return "<S-Down>"
            end
        end,
        "Scroll down",
        expr = true,
        replace_keycodes = true
    },
    ["<S-Up>"] = {
        function()
            if vim.fn["coc#float#has_scroll"]() == 1 then
                vim.fn["coc#float#scroll"](0, 1)
            else
                return "<S-Up>"
            end
        end,
        "Scroll up",
        expr = true,
        replace_keycodes = true
    },
    ["<TAB>"] = {
        function()
            if vim.fn["coc#pum#visible"]() == 1 then
                return vim.fn["coc#pum#next"](1)
            end
            if noTextBehindCursor() then
                return "<TAB>"
            end
            vim.fn["coc#refresh"]()
        end,
        "pum-next/refresh/tab",
        expr = true,
        replace_keycodes = true
    },
    ["<S-TAB>"] = {
        function()
            if vim.fn["coc#pum#visible"]() == 1 then
                return vim.fn["coc#pum#prev"](1)
            end
            if noTextBehindCursor() then
                return "<C-h>"
            end
            vim.fn["coc#refresh"]()
        end,
        "pum-prev/refresh/s-tab",
        expr = true,
        replace_keycodes = true
    },
    ["<CR>"] = {
        function()
            if vim.fn["coc#pum#visible"]() == 1 then
                return vim.fn["coc#pum#confirm"]()
            end
            return "<CR>"
        end,
        "Confirm",
        expr = true,
        replace_keycodes = true
    },
}
M.c_mappings = {
    ["<S-Enter>"] = { function() require("noice").redirect(vim.fn.getcmdline()) end, "Redirect Cmdline" }
}
return M
