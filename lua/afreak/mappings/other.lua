local M = {}
local utils = require('afreak.utils.other')
local h = utils.functionHelper
local c = utils.cmd
local p = utils.plug
local unimpairedToggles = {
    b = { "background" },
    c = { "cursorline" },
    d = { "diff" },
    h = { "hlsearch" },
    i = { "ignorecase" },
    l = { "list" },
    n = { "number" },
    r = { "relativenumber" },
    s = { "spell" },
    t = { "colorcolumn" },
    u = { "cursorcolumn" },
    v = { "virtualedit" },
    w = { "wrap" },
    x = { "cursorline + cursorcolumn" },
}
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
    ["<C-Up>"] = { "<C-W>k", "go window up" },
    ["<C-Down>"] = { "<C-W>j", "go window down" },
    ["<C-Left>"] = { "<C-W>h", "go window left" },
    ["<C-Right>"] = { "<C-W>l", "go window right" },
    ['<C-h>'] = { h('mini.move', 'move_line', 'left'), "move line left" },
    ['<C-l>'] = { h('mini.move', 'move_line', 'right'), "move line right" },
    ['<C-j>'] = { h('mini.move', 'move_line', 'down'), "move line down" },
    ['<C-k>'] = { h('mini.move', 'move_line', 'up'), "move line up" },
    -- center cursor after scroll is sweet
    ["<C-d>"] = { "<C-d>zz", "scroll down" },
    ["<C-u>"] = { "<C-u>zz", "scroll up" },
    g = {
        -- because netrw is disabled, need to open urls another way
        -- netrw is not disabled anymore
        -- x = { [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], "navigate to url" },
        m = { h('leap', 'leap', function()
            return { target_windows = require('leap.util').get_enterable_windows() }
        end), "leap-cross-window" },
        y = { p("coc-type-definition"), "show type definition" },
        r = { p("coc-references"), "show references" },
        d = { p("coc-definition"), "show definition" },
        D = { p("coc-implementation"), "show implementation" },
    },
    y = {
        o = vim.tbl_extend("error", unimpairedToggles, {
            name = "+toggle",
            q = { h('afreak.utils.other', 'qfToggle'), "quickfix-list" },
            o = { c("UndotreeToggle"), "undotree" },
        }),
    },
    ["<Esc>"] = { function()
        vim.schedule(function()
            vim.fn["coc#float#close_all"](1)
            vim.cmd([[nohlsearch]])
            require('notify').dismiss()
        end)
        return "<Esc>"
    end, "dismiss", expr = true, replace_keycodes = true },
    s = { h("substitute", "operator"), "subtitute txt given by operator by register0" },
    ["ss"] = { h("substitute", "line"), "substitute line by register0" },
    S = { h("substitute", "eol"), "substitute to end of line by register0" },
    ["["] = {
        p = { "Put above" },
        P = { "Put above" },
        a = { "previous" },
        A = { "first" },
        q = { "cprevious" },
        Q = { "cfirst" },
        t = { "tprevious" },
        T = { "tfirst" },
        l = { "lprevious" },
        L = { "lfirst" },
        b = { "bprevious" },
        B = { "bfirst" },
        f = { "Go to prev file in directory" },
        n = { "Go to prev conflict/diff/hunk" },
        e = { "Exchange line with lines above" },
        ["<Space>"] = { "Add empty lines above" },
        ["<C-L>"] = { "lpfile" },
        ["<C-Q>"] = { "cpfile" },
        ["<C-T>"] = { "ptprevious" },
        o = vim.tbl_extend("error", unimpairedToggles, {
            name = "+Enable/Show",
            o = { vim.cmd.lopen, "location-list" },
            q = { vim.cmd.copen, "quickfix-list" },
        }),
        h = { function()
            vim.schedule(require('gitsigns').prev_hunk)
            return "<Ignore>"
        end, "prev hunk",
            { expr = true } },
        g = { p("coc-diagnostic-prev"), "coc diagnostic prev" },
    },
    ["]"] = {
        p = { "Put below" },
        P = { "Put below" },
        a = { "next" },
        A = { "last" },
        q = { "cnext" },
        Q = { "clast" },
        t = { "tnext" },
        T = { "tlast" },
        l = { "lnext" },
        L = { "llast" },
        b = { "bnext" },
        B = { "blast" },
        f = { "Go to next file in directory" },
        n = { "Go to next conflict/diff/hunk" },
        e = { "Exchange line with lines below" },
        ["<Space>"] = { "Add empty lines below" },
        ["<C-L>"] = { "lnfile" },
        ["<C-Q>"] = { "cnfile" },
        ["<C-T>"] = { "ptnext" },
        o = vim.tbl_extend("error", unimpairedToggles, {
            name = "+Disable/Hide",
            o = { vim.cmd.lclose, "location-list" },
            q = { vim.cmd.cclose, "quickfix-list" },
        }),
        h = { function()
            vim.schedule(require('gitsigns').next_hunk)
            return "<Ignore>"
        end, "next hunk",
            { expr = true } },
        g = { p("coc-diagnostic-next"), "coc diagnostic next" },
    },
    ["="] = {
        P = { "Paste before linewise, reindenting" },
        p = { "Paste after linewise, reindenting" },
    },
    ["<"] = {
        P = { "Paste before linewise, decreasing indent" },
        p = { "Paste after linewise, decreasing indent" },
    },
    [">"] = {
        P = { "Paste before linewise, increasing indent" },
        p = { "Paste after linewise, increasing indent" },
    },
    m = { h('leap', 'leap', {}), "leap-forward-to" },
    M = { h('leap', 'leap', { backward = true }), "leap-backward-to" },
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
    s = { h("substitute", "visual"), "substitute visual selection by register0" },
    i = {
        h = { c("Gitsigns select_hunk"), "hunk", mode = { "o", "x" } },
    },
    g = {
        M = { ":lua require('tsht').nodes()<CR>", "treehopper expand selection", mode = "x" },
    },
    m = { h('leap', 'leap', { offset = 1, inclusive_op = true, match_last_overlapping = true }), "leap-forward-to",
        mode = { "o", "x" } },
    M = { h('leap', 'leap', { backward = true, match_last_overlapping = true }), "leap-backward-to", mode = { "o", "x" } },
    x = { h('leap', 'leap', { offset = -1, inclusive_op = true }), "leap-forward-till", mode = { "o", "x" } },
    X = { h('leap', 'leap', { offset = 2, backward = true }), "leap-backward-till", mode = { "o", "x" } },
    ['<C-h>'] = { h('mini.move', 'move_selection', 'left'), "move selection left" },
    ['<C-l>'] = { h('mini.move', 'move_selection', 'right'), "move selection right" },
    ['<C-j>'] = { h('mini.move', 'move_selection', 'down'), "move selection down" },
    ['<C-k>'] = { h('mini.move', 'move_selection', 'up'), "move selection up" },
}

local noTextBehindCursor = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

M.i_mappings = {
    ["<S-Down>"] = { function()
        if vim.fn["coc#float#has_scroll"]() == 1 then
            vim.fn["coc#float#scroll"](1, 1)
        else
            return "<S-Down>"
        end
    end, "Scroll down", expr = true, replace_keycodes = true },
    ["<S-Up>"] = { function()
        if vim.fn["coc#float#has_scroll"]() == 1 then
            vim.fn["coc#float#scroll"](0, 1)
        else
            return "<S-Up>"
        end
    end, "Scroll up", expr = true, replace_keycodes = true },
    ["<TAB>"] = { function()
        if vim.fn["coc#pum#visible"]() == 1 then
            return vim.fn["coc#pum#next"](1)
        end
        if noTextBehindCursor() then
            return "<TAB>"
        end
        vim.fn["coc#refresh"]()
    end, "pum-next/refresh/tab", expr = true, replace_keycodes = true },
    ["<S-TAB>"] = { function()
        if vim.fn["coc#pum#visible"]() == 1 then
            return vim.fn["coc#pum#prev"](1)
        end
        if noTextBehindCursor() then
            return "<C-h>"
        end
        vim.fn["coc#refresh"]()
    end, "pum-prev/refresh/s-tab", expr = true, replace_keycodes = true },
    ["<CR>"] = { function()
        if vim.fn["coc#pum#visible"]() == 1 then
            return vim.fn["coc#pum#confirm"]()
        end
        return "<CR>"
    end, "confirm", expr = true, replace_keycodes = true },
}
M.c_mappings = {
    ["<S-Enter>"] = { function() require("noice").redirect(vim.fn.getcmdline()) end, "Redirect Cmdline" }
}
return M
