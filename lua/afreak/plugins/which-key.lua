return { 'folke/which-key.nvim', config = function()
    vim.o.timeoutlen = 500
    function mergeTables(base, extend)
        -- not pure, will mutate base
        for key, value in pairs(extend) do
            base[key] = value
        end
        return base
    end

    function fzfGreps(opts, restOfTable)
        return mergeTables({
            g = { "<cmd>lua require('fzf-lua').grep(" .. opts .. ")<CR>", "run search for a pattern" },
            W = { "<cmd>lua require('fzf-lua').grep_cWORD(" .. opts .. ")<CR>", "search WORD under cursor" },
            w = { "<cmd>lua require('fzf-lua').grep_cword(" .. opts .. ")<CR>", "search word under cursor" },
            v = { "<cmd>lua require('fzf-lua').grep_visual(" .. opts .. ")<CR>", "search visual selection" },
            l = { "<cmd>lua require('fzf-lua').grep_last(" .. opts .. ")<CR>", "run search again with the last pattern" },
            p = { "<cmd>lua require('fzf-lua').grep_project(" .. opts .. ")<CR>", "search all project lines" },
            b = { "<cmd>lua require('fzf-lua').grep_curbuf(" .. opts .. ")<CR>", "grep current buffer" },
        }, restOfTable)
    end

    function fzfFileFind(opts, restOfTable)
        return mergeTables({
            p = { "<cmd>lua require('fzf-lua').files(" .. opts .. ")<CR>", "Files" },
            g = { "<cmd>lua require('fzf-lua').git_files(" .. opts .. ")<CR>", "Git files" },
        }, restOfTable)
    end

    local spaceMaps = fzfFileFind("", {
        q = fzfGreps("", {
            name = "+fzf",
            h = { "<cmd>lua require('fzf-lua').search_history()<CR>", "search history" },
            j = { "<cmd>lua require('fzf-lua').jumps()<CR>", ":jumps" },
            c = { "<cmd>lua require('fzf-lua').changes()<CR>", ":changes" },
            s = { "<cmd>lua require('fzf-lua').spell_suggest()<CR>", "Spelling suggestions" },
            d = fzfGreps("{ cwd = vim.fn.expand('%:p:h'), cmd = 'grep -r -i --line-number --color=auto --perl-regex' }",
                {
                    name = "+relativeToBuffer"
                })
        }),
        w = { '<cmd>w<CR>', 'save file' },
        f = { "<cmd>CocCommand explorer<CR>", "Explorer" },
        -- p = { "<cmd>lua require('fzf-lua').files()<CR>", "Files" }, !BEING MERGED IN BY fzfFileFind
        -- g = { "<cmd>lua require('fzf-lua').git_files()<CR>", "Git files" },
        j = {},
        l = {
            name = "+Lazy",
            o = { "<cmd>Lazy home<CR>", "Lazy home" },
            u = { "<cmd>Lazy check<CR>", "Check for updates and show the log" },
            c = { "<cmd>Lazy clean<CR>", "Clean plugins that are no longer needed" },
            e = { "<cmd>Lazy clear<CR>", "Clear finished tasks" },
            d = { "<cmd>Lazy debug<CR>", "Show debug info" },
            h = { "<cmd>Lazy health<CR>", "Run :checkhealth lazy" },
            p = { "<cmd>Lazy help<CR>", "Lazy help" },
            i = { "<cmd>Lazy install<CR>", "Install missing plugins" },
            l = { "<cmd>Lazy log<CR>", "Show recent updates" },
            r = { "<cmd>Lazy profile<CR>", "Show detailed profiling" },
            s = { "<cmd>Lazy sync<CR>", "Run install, clean and update" },
            t = { "<cmd>Lazy update<CR>", "Update plugins. This will also update the lockfile" },
        },
        u = { '<cmd>UndotreeToggle<CR>', 'Undotree toggle' },
        y = {
            name = "+yank/put",
            f = { "<cmd>%y<CR>", "content of buffer" },
            n = { ":let @+=expand('%')<CR>", "filename" },
            t = {
                name = "+tpaste",
                f = { ":w !curl --silent -F 'tpaste=<-' https://tpaste.us | xclip -out -in -selection clipboard<CR>",
                    "File > tpaste.us" },
                v = { ":'<,'>w !curl --silent -F 'tpaste=<-' https://tpaste.us | xclip -out -in -selection clipboard<CR>",
                    "Visually selection > tpaste.us" },
            },
        },
        [";"] = { "<cmd>lua require('fzf-lua').command_history()<CR>", "command history" },
        a = {},
        r = {},
        s = {}, --used for subversive
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
        d = {
            name = '+debug(dap)',
            c = { "<Cmd>lua require'dap'.continue()<CR>", 'continue' },
            o = { "<Cmd>lua require'dap'.step_over()<CR>", 'step_over' },
            k = { "<Cmd>lua require'dap'.step_back()<CR>", 'step back' },
            i = { "<Cmd>lua require'dap'.step_into()<CR>", 'step_into' },
            O = { "<Cmd>lua require'dap'.step_out()<CR>", 'step_out' },
            b = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", 'toggle_breakpoint' },
            B = { "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
                'set_breakpoint(breakpoint condition)' },
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
        h = {
            name = "+ChatGPT"
        }, -- chatgpt
        n = { function()
            vim.cmd([[nohlsearch]])
            require('notify').dismiss()
        end, "nonoise" },
        e = { "<cmd>lua require('fzf-lua').resume()<CR>", 'fzf resume last' },
        i = {
            name = "+diff",
            e = { ":diffthis<cr>", "diffthis" },
            d = { ":diffoff<cr>", "diffoff" },
            o = { ":diffoff!<cr>", "diffoff!" },
            w = { ":windo diffthis<cr>", "windo diffthis" },
        },
        o = {
            name = '+tab/window',
            e = { "<cmd>tabe<CR>", "tab new" },
            v = { "<cmd>vsplit<CR>", "vertical split" },
            s = { "<cmd>split<CR>", "horizontal split" },
            c = { "<cmd>tabclose<CR>", "tab close" },
            o = { "<cmd>tabonly<CR>", "tab only" },
            u = { "<cmd>+tabmove<CR>", "tab up" },
            d = { "<cmd>-tabmove<CR>", "tab down" },
        },
        z = {
            name = "+theme",
            d = { ":set background=dark<CR>", "dark" },
            l = { ":set background=light<CR>", "light" },
            t = { ":hi Normal guibg=NONE ctermbg=NONE<CR>", "transparent" },
        },
        x = { function()
            for _, win in pairs(vim.fn.getwininfo()) do
                if win['quickfix'] == 1 then
                    return vim.cmd.cclose()
                end
            end
            vim.cmd.copen()
        end, "quickfixtoggle" },
        c = {
            name = "+coc-actions",
            l = { "<Plug>(coc-codeaction-line)", "codeaction-line" },
            a = { "<Plug>(coc-codeaction)", "codeaction" },
            c = { "<Plug>(coc-codeaction-cursor)", "codeaction-cursor" },
            v = { "<Plug>(coc-codeaction-selected)", "codeaction-selected" },
            s = { "<Plug>(coc-codelens-action)", "codelens-action" },
            n = { "<Plug>(coc-diagnostic-next)", "diagnostic-next" },
            p = { "<Plug>(coc-diagnostic-prev)", "diagnostic-prev" },

            i = { "<Plug>(coc-implementation)", "goto-implementation" },
            t = { "<Plug>(coc-type-definition)", "goto-type-definition" },
            r = { "<Plug>(coc-references)", "goto-references" },
            d = { "<Plug>(coc-definition)", "goto-definition" },

            e = { "<Plug>(coc-rename)", "rename" },
            f = { "<Plug>(coc-refactor)", "refactor" },
            g = {
                name = "+diagnostics enable/disable",
                d = { ":<c-u>call coc#config('diagnostic.enable', 0)<cr>", "diagnostic enable" },
                e = { ":<c-u>call coc#config('diagnostic.enable', 1)<cr>", "diagnostic disable" },
            },
            w = { ":<c-u>call coc#float#close_all() <CR>", "close all floating windows" },
            x = {
                name = "+coclists",
                l = { "<cmd>CocFzfList<cr>", "List all list sources" },
                -- Show all diagnostics
                d = { "<cmd>CocFzfList diagnostics<cr>", "diagnostics" },
                -- Manage extensions
                e = { "<cmd>CocFzfList extensions<cr>", "extensions" },
                -- Show commands
                c = { "<cmd>CocFzfList commands<cr>", "commands" },
                -- Find symbol of current document
                o = { "<cmd>CocFzfList outline<cr>", "outline" },
                -- Search workspace symbols
                s = { "<cmd>CocFzfList symbols<cr>", "symbols" },
                -- Resume latest coc list
                r = { "<cmd>CocFzfListResume<CR>", "coclistresume" },
                u = { "<cmd>CocCommand workspace.showOutput<CR>", "coccommand workspace.showOutput" },
            },
        },
        v = fzfFileFind("{cwd = '~/.config/nvim'}", {
            name = '+vimrc',
            q = fzfGreps("{cwd = '~/.config/nvim'}", { name = "+relativeToNvimConfig" }),
            o = { ":so %<cr>", "source this file" },
        }),
        b = {
            name = '+buffer',
            l = { "<cmd>lua require('fzf-lua').buffers()<CR>", "list" },
            o = { ":%bd <bar> e# <bar> bd#<CR> <bar>'\"", "only" },
        },
        k = {},
        m = {},
        [","] = {},
        ["."] = {},
        ["/"] = {},
        ["<space>"] = { function()
            require('legendary').find({ filters = { require('legendary.filters').current_mode() } })
        end, "legendary" },
    })
    local wk = require('which-key')
    wk.setup { show_keys = false, show_help = false }
    wk.register(spaceMaps, { prefix = " ", mode = "n" })
    wk.register(spaceMaps, { prefix = " ", mode = "x" })
    --
    local leaderkeymap = {
        P = { function()
            require('neoclip.fzf')("+")
        end, "registerPlusSelect" },
        p = { function()
            require('neoclip.fzf')()
        end, "registerUnnamedSelect" }
    }
    wk.register(leaderkeymap, { prefix = '<leader>' })
    --
    local local_keymap = {
        ["<space>"] = { function()
            require('legendary').find({ filters = { require('legendary.filters').current_mode() } })
        end, "legendary" },
    }

    wk.register(local_keymap, { prefix = '<localleader>' })
end
}
