vim.g.maplocalleader = "<F2>"
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
    w = {':w<CR>', 'save file'}, -- set a single command and text
    u = {':UndotreeToggle<CR>', 'Undotree toggle'},
    d = { -- set a nested structure
        name = '+debug(dap)',
        c = {"<Cmd>lua require'dap'.continue()<CR>", 'continue'},
        o = {"<Cmd>lua require'dap'.step_over()<CR>", 'step_over'},
        k = {"<Cmd>lua require'dap'.step_back()<CR>", 'step back'},
        i = {"<Cmd>lua require'dap'.step_into()<CR>", 'step_into'},
        O = {"<Cmd>lua require'dap'.step_out()<CR>", 'step_out'},
        b = {"<Cmd>lua require'dap'.toggle_breakpoint()<CR>", 'toggle_breakpoint'},
        B = {"<Cmd>set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", 'set_breakpoint(breakpoint condition)'},
        l = {"<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", 'set_breakpoint(log point message)'},
        r = {"<Cmd>lua require'dap'.repl.open()<CR>", 'repl open'},
        a = {"<Cmd>lua require'dap'.run_last()<CR>", 'run last'},
        l = {"<Cmd>lua require'dap'.list_breakpoints()<CR>", 'list breakpoints'},
        u = {"<Cmd>lua require'dapui'.toggle()<CR>", 'toggle ui'},
    },
    v = {
        name = '+vimrc',
        e = {":vsplit $MYVIMRC<CR>", "edit vimrc"},
        g = {":VimFiles<CR>", "find vim file"},
        s = {":Reload<cr>", "nvim-reload"},
        q = {":VimFilesAg<space>", "find in vim files"},
        o = {":so %<cr>", "source this file"},
    },
    y = {
        name = "+yank",
        f = {":%y<CR>", "content of buffer"},
        n = {":let @+=expand('%')<CR>", "filename"},
    },
    z = {
        name = "+theme",
        d = {":set background=dark<CR>", "dark"},
        l = {":set background=light<CR>", "light"},
        t = {":hi Normal guibg=NONE ctermbg=NONE<CR>", "transparent"},
    },
    t = {
        name = '+git',
        s = {':Git<CR>', 'Status'},
        p = {':Git pull<CR>',   'Pull'},
        h = {':Git push<CR>',   'Push'},
        d = {':Gdiffsplit<CR>', 'split'},
        b = {':Git blame<CR>',  'blame'},
        l = {':Gclog<CR>',  'log'},
        o = {':GBrowse<CR>',  'browse'},
        w = {':Gwrite<CR>',  'write'},
        r = {':Gread<CR>',  'read'},
        c = {':Gbranch<CR>',  'checkout branch'},
    },
    g = {":GFilesRecursive<cr>", "Git files"},
    p = {":Files<cr>", "Files"},
    b = {
       name = '+buffer',
       l = {":Buffers<cr>", "list"},
       o = {":%bd <bar> e# <bar> bd#<CR> <bar>'\"", "only"},
    },

    n = {":noh<cr> ", "nohilight"},
    f = {":CocCommand explorer<CR>", "Explorer"},
    c = {
        name = "+fzf-stuff",
        x = {":IPaste<cr>", "IPaste"},
        l = {":BLines<cr>", "BLines"},
        h = {":Helptags<cr>", "Helptags"},
        c = {":Commands<cr>", "Commands"},
        m = {":Maps<cr>", "Maps"},
    },
    a = {
        name = "+coc-codeaction",
        l = {"<Plug>(coc-codeaction-line)","coc-codeaction-line"},
        f = {"<Plug>(coc-codeaction)","coc-codeaction"},
        c = {"<Plug>(coc-codeaction-cursor)","coc-codeaction-cursor"},
        s = {"<Plug>(coc-codeaction-selected)","coc-codeaction-selected"},
        e = {"<Plug>(coc-codelens-action)", "coc-codelens-action"},
    },
    i = {
        name = "+diff",
        e = {":diffthis<cr>", "diffthis"},
        d = {":diffoff<cr>", "diffoff"},
        o = {":diffoff!<cr>", "diffoff!"},
        w = {":windo diffthis<cr>", "windo diffthis"},
   },
   o = {
        name = "+coc-diagnostic",
        d = {":<c-u>call coc#config('diagnostic.enable', 0)<cr>","enable"},
        e = {":<c-u>call coc#config('diagnostic.enable', 1)<cr>","disable"},
   },
   r = {
        name = "+rename/refactor(coc)",
        e = {"<Plug>(coc-rename)", "rename"},
        f = {"<Plug>(coc-refactor)", "refactor"},
   },
   l = {
       name = "+coclists",
     l = {":<C-u>CocList<cr>", "CocList"},
    -- Show all diagnostics
     d = {":<C-u>CocList diagnostics<cr>", "diagnostics"},
    -- Manage extensions
     e = {":<C-u>CocList extensions<cr>", "extensions"},
    -- Show commands
     c = {":<C-u>CocList commands<cr>", "commands"},
    -- Find symbol of current document
     o = {":<C-u>CocList outline<cr>", "outline"},
    -- Search workspace symbols
     s = {":<C-u>CocList -I symbols<cr>", "symbols"},
    -- Do default action for next item.
     n = {":<C-u>CocNext<CR>", "cocnext"},
    -- Do default action for previous item.
     p = {":<C-u>CocPrev<CR>", "cocprev"},
    -- Resume latest coc list
     r = {":<C-u>CocListResume<CR>", "coclistresume"},
     a = {":<C-u>CocListCancel<CR>", "coclistcancel"},
     u = {":<C-u>CocCommand workspace.showOutput<CR>", "coccommand workspace.showOutput"},
   },
   k = { ":lua qftoggle()<CR>", "quickfixtoggle" },
   [";"] = {":History:<cr>", "History"},
}

wk.register(keymap, {prefix = " ", mode = "n"})
wk.register(keymap, {prefix = " ", mode = "v"})
local leaderkeymap = {
}
wk.register(leaderkeymap, {prefix = '<leader>'})

local local_keymap = {
}

wk.register(local_keymap, {prefix = '<localleader>'})