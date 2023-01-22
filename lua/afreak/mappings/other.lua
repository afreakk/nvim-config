local M = {}
local utils = require('afreak.utils.other')
local h = utils.h
local c = utils.c
local p = utils.p
M.terminalMappings = {
    ["<C-Up>"] = { "<C-\\><C-N><C-w>h", "go window up" },
    ["<C-Down>"] = { "<C-\\><C-N><C-w>j", "go window down" },
    ["<C-Left>"] = { "<C-\\><C-N><C-w>k", "go window left" },
    ["<C-Right>"] = { "<C-\\><C-N><C-w>l", "go window right" },
    ["<Space><Esc>"] = { "<C-\\><C-n>", "exit insert mode" }
}

M.n_mappings = {
    ["<C-W>"] = {
        ["<C-M>"] = { c("WinShift"), "WinShift (modal)" },
        m = { c("WinShift"), "WinShift (modal)" },
        X = { c("WinShift swap"), "WinShift swap" },
    },
    ["<S-Left>"] = { c("WinShift left"), "WinShift left" },
    ["<S-Down>"] = { c("WinShift down"), "WinShift down" },
    ["<S-Up>"] = { c("WinShift up"), "WinShift up" },
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
        x = { [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], "navigate to url" },
        m = { h('leap', 'leap', function()
            return { target_windows = require('leap.util').get_enterable_windows() }
        end), "leap-cross-window" },
        y = { p("coc-type-definition"), "show type definition" },
        r = { p("coc-references"), "show references" },
        d = { p("coc-definition"), "show definition" },
        D = { p("coc-implementation"), "show implementation" },
    },
    ["<Esc>"] = { function()
        vim.schedule(function()
            vim.cmd([[nohlsearch]])
            require('notify').dismiss()
        end)
        return "<Esc>"
    end, "dismiss", expr = true, replace_keycodes = true },
    s = { h("substitute", "operator"), "subtitute txt given by operator by register0" },
    ["ss"] = { h("substitute", "line"), "substitute line by register0" },
    S = { h("substitute", "eol"), "substitute to end of line by register0" },
    ["]"] = {
        h = { function() vim.schedule(require('gitsigns').next_hunk) return "<Ignore>" end, "next hunk",
            { expr = true } },
        g = { p("coc-diagnostic-next"), "coc diagnostic next" },
    },
    ["["] = {
        h = { function() vim.schedule(require('gitsigns').prev_hunk) return "<Ignore>" end, "prev hunk",
            { expr = true } },
        g = { p("coc-diagnostic-prev"), "coc diagnostic prev" },
    },
    m = { h('leap', 'leap', {}), "leap-forward-to" },
    M = { h('leap', 'leap', { backward = true }), "leap-backward-to" },
    K = { c("lua _G.show_docs()"), "Show documentation" },
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
M.i_mappings = {
    ["<TAB>"] = { 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
        "pum-next (or)", silent = true, noremap = true, expr = true, replace_keycodes = false },
    ["<S-TAB>"] = { 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', "pum-prev", silent = true, noremap = true,
        expr = true, replace_keycodes = false },
    -- Make <CR> to accept selected completion item or notify coc.nvim to format
    -- <C-g>u breaks current undo, please make your own choice
    ["<cr>"] = { 'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', "confirm", silent = true,
        noremap = true, expr = true, replace_keycodes = false },
}
M.c_mappings = {
    ["<S-Enter>"] = { function() require("noice").redirect(vim.fn.getcmdline()) end, "Redirect Cmdline" }
}
return M
