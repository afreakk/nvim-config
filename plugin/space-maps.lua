vim.g.maplocalleader = "+"
vim.g.mapleader = "\\"

local wk = require('which-key')
wk.setup {
    -- Need to fix d c  & y for which-key (not working because of easy-clip)
    -- operators = { ['"_d'] = "Delete" },
    -- operators = { ['"_c'] = "Change" },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
local keymap = {
    w = { ':w<CR>', 'save file' }, -- set a single command and text
    u = { ':UndotreeToggle<CR>', 'Undotree toggle' },
    d = { -- set a nested structure
        name = '+debug(dap)',
        c = { "<Cmd>lua require'dap'.continue()<CR>", 'continue' },
        o = { "<Cmd>lua require'dap'.step_over()<CR>", 'step_over' },
        k = { "<Cmd>lua require'dap'.step_back()<CR>", 'step back' },
        i = { "<Cmd>lua require'dap'.step_into()<CR>", 'step_into' },
        O = { "<Cmd>lua require'dap'.step_out()<CR>", 'step_out' },
        b = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", 'toggle_breakpoint' },
        B = { "<Cmd>set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", 'set_breakpoint(breakpoint condition)' },
        s = { "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
            'set_breakpoint(log point message)' },
        r = { "<Cmd>lua require'dap'.repl.open()<CR>", 'repl open' },
        a = { "<Cmd>lua require'dap'.run_last()<CR>", 'run last' },
        l = { "<Cmd>lua require'dap'.list_breakpoints()<CR>", 'list breakpoints' },
        u = { "<Cmd>lua require'dapui'.toggle()<CR>", 'toggle ui' },
        f = { "<cmd>lua require('fzf-lua').dap_commands()<CR>", "fzf: list,run nvim-dap builtin commands" },
        n = { "<cmd>lua require('fzf-lua').dap_configurations()<CR>", "fzf: list,run debug configurations" },
        e = { "<cmd>lua require('fzf-lua').dap_breakpoints()<CR>", "fzf: list,delete breakpoints" },
        v = { "<cmd>lua require('fzf-lua').dap_variables()<CR>", "fzf: active session variables" },
        m = { "<cmd>lua require('fzf-lua').dap_frames()<CR>", "fzf: active session jump to frame" },
    },
    v = {
        name = '+vimrc',
        e = { ":vsplit $MYVIMRC<CR>", "edit vimrc" },
        g = { "<cmd>lua require('fzf-lua').files({cwd = '~/.config/nvim'})<CR>", "find vim file" },
        s = { ":Reload<cr>", "nvim-reload" },
        q = { "<cmd>lua require('fzf-lua').grep({cwd = '~/.config/nvim'})<CR>", "find in vim files" },
        o = { ":so %<cr>", "source this file" },
    },
    y = {
        name = "+yank",
        f = { ":%y<CR>", "content of buffer" },
        n = { ":let @+=expand('%')<CR>", "filename" },
        t = {
            name = "+tpaste",
            f = { ":!cat % | curl -F 'tpaste=<-' https://tpaste.us<CR>", "file to tpaste" },
            v = { ":'<,'>:w !curl -F 'tpaste=<-' https://tpaste.us<CR>", "visually selected to tpaste" },
        },
    },
    z = {
        name = "+theme",
        d = { ":set background=dark<CR>", "dark" },
        l = { ":set background=light<CR>", "light" },
        t = { ":hi Normal guibg=NONE ctermbg=NONE<CR>", "transparent" },
    },
    t = {
        name = '+git',
        s = { ':Git<CR>', 'Status' },
        p = { ':Git pull<CR>', 'Pull' },
        h = { ':Git push<CR>', 'Push' },
        d = { ':Gdiffsplit<CR>', 'split' },
        b = { ':Git blame<CR>', 'blame' },
        l = { ':Gclog<CR>', 'log' },
        o = { ':GBrowse<CR>', 'browse' },
        w = { ':Gwrite<CR>', 'write' },
        r = { ':Gread<CR>', 'read' },
        a = { "<cmd>lua require('fzf-lua').git_branches()<CR>", 'checkout branch' },
        t = { "<cmd>lua require('fzf-lua').git_stash()<CR>", 'stash' },
        c = { "<cmd>lua require('fzf-lua').git_commits()<CR>", 'commit log (project)' },
        u = { "<cmd>lua require('fzf-lua').git_bcommits()<CR>", 'commit log (buffer)' },
    },
    e = { "<cmd>lua require('fzf-lua').resume()<CR>", 'fzf resume last' },
    g = { "<cmd>lua require('fzf-lua').git_files()<CR>", "Git files" },
    p = { "<cmd>lua require('fzf-lua').files()<CR>", "Files" },
    b = {
        name = '+buffer',
        l = { "<cmd>lua require('fzf-lua').buffers()<CR>", "list" },
        o = { ":%bd <bar> e# <bar> bd#<CR> <bar>'\"", "only" },
    },

    n = { ":noh<cr> ", "nohilight" },
    f = { ":CocCommand explorer<CR>", "Explorer" },
    a = {
        name = "+coc-actions",
        l = { "<Plug>(coc-codeaction-line)", "codeaction-line" },
        f = { "<Plug>(coc-codeaction)", "codeaction" },
        c = { "<Plug>(coc-codeaction-cursor)", "codeaction-cursor" },
        s = { "<Plug>(coc-codeaction-selected)", "codeaction-selected" },
        e = { "<Plug>(coc-codelens-action)", "codelens-action" },
        n = { "<Plug>(coc-diagnostic-prev)", "diagnostic-next" },
        p = { "<Plug>(coc-diagnostic-prev)", "diagnostic-prev" },

        i = { "<Plug>(coc-implementation)", "goto-implementation" },
        t = { "<Plug>(coc-type-definition)", "goto-type-definition" },
        r = { "<Plug>(coc-references)", "goto-references" },
        d = { "<Plug>(coc-definition)", "goto-definition" },
    },
    i = {
        name = "+diff",
        e = { ":diffthis<cr>", "diffthis" },
        d = { ":diffoff<cr>", "diffoff" },
        o = { ":diffoff!<cr>", "diffoff!" },
        w = { ":windo diffthis<cr>", "windo diffthis" },
    },
    o = {
        name = "+coc-other",
        d = { ":<c-u>call coc#config('diagnostic.enable', 0)<cr>", "diagnostic enable" },
        e = { ":<c-u>call coc#config('diagnostic.enable', 1)<cr>", "diagnostic disable" },
        c = { ":<c-u>call coc#float#close_all() <CR>", "close all floating windows" },
    },
    r = {
        name = "+rename/refactor(coc)",
        e = { "<Plug>(coc-rename)", "rename" },
        f = { "<Plug>(coc-refactor)", "refactor" },
    },
    l = {
        name = "+coclists",
        l = { ":<C-u>CocList<cr>", "CocList" },
        -- Show all diagnostics
        d = { ":<C-u>CocList diagnostics<cr>", "diagnostics" },
        -- Manage extensions
        e = { ":<C-u>CocList extensions<cr>", "extensions" },
        -- Show commands
        c = { ":<C-u>CocList commands<cr>", "commands" },
        -- Find symbol of current document
        o = { ":<C-u>CocList outline<cr>", "outline" },
        -- Search workspace symbols
        s = { ":<C-u>CocList -I symbols<cr>", "symbols" },
        -- Do default action for next item.
        n = { ":<C-u>CocNext<CR>", "cocnext" },
        -- Do default action for previous item.
        p = { ":<C-u>CocPrev<CR>", "cocprev" },
        -- Resume latest coc list
        r = { ":<C-u>CocListResume<CR>", "coclistresume" },
        a = { ":<C-u>CocListCancel<CR>", "coclistcancel" },
        u = { ":<C-u>CocCommand workspace.showOutput<CR>", "coccommand workspace.showOutput" },
    },
    k = { ":lua qftoggle()<CR>", "quickfixtoggle" },
    [";"] = { "<cmd>lua require('fzf-lua').command_history()<CR>", "command history" },
    ["<space>"] = { ":Legendary<cr>", "Legendary" },
    q = {
        name = "+fzf",
        g = { "<cmd>lua require('fzf-lua').grep()<CR>", "run search for a pattern" },
        l = { "<cmd>lua require('fzf-lua').grep_last()<CR>", "run search again with the last pattern" },
        W = { "<cmd>lua require('fzf-lua').grep_cWORD()<CR>", "search WORD under cursor" },
        w = { "<cmd>lua require('fzf-lua').grep_cword()<CR>", "search word under cursor" },
        v = { "<cmd>lua require('fzf-lua').grep_visual()<CR>", "search visual selection" },
        p = { "<cmd>lua require('fzf-lua').grep_project()<CR>", "search all project lines" },
        b = { "<cmd>lua require('fzf-lua').grep_curbuf()<CR>", "grep current buffer" },
        h = { "<cmd>lua require('fzf-lua').search_history()<CR>", "search history" },
        j = { "<cmd>lua require('fzf-lua').jumps()<CR>", ":jumps" },
        r = { "<cmd>lua require('fzf-lua').resume()<CR>", "resume last command/query" },
        c = { "<cmd>lua require('fzf-lua').changes()<CR>", ":changes" },
    },
}

wk.register(keymap, { prefix = " ", mode = "n" })
wk.register(keymap, { prefix = " ", mode = "v" })
local leaderkeymap = {
}
wk.register(leaderkeymap, { prefix = '<leader>' })

local local_keymap = {
}

wk.register(local_keymap, { prefix = '<localleader>' })
