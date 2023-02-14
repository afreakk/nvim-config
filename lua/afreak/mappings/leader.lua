local utils = require("afreak.utils.other")
local fzfUtils = require("afreak.utils.fzf")
local h = utils.functionHelper
local c = utils.cmd
local p = utils.plug
local grepCmd = 'grep -r -i --line-number --color=auto --perl-regex'
local M = {}
M.spaceMaps = fzfUtils.fzfFileFind({}, {
        q = fzfUtils.fzfGreps({}, {
            name = "+fzf",
            h = { h('fzf-lua', 'search_history'), "search history" },
            j = { h('fzf-lua', 'jumps'), ":jumps" },
            c = { h('fzf-lua', 'changes'), ":changes" },
            s = { h('fzf-lua', 'spell_suggest'), "Spelling suggestions" },
            d = fzfUtils.fzfGreps(function()
                return { cwd = vim.fn.expand('%:p:h'), cmd = grepCmd }
            end, {
                name = "+relativeToBuffer"
            }),
            a = fzfUtils.fzfGreps({ cmd = grepCmd }, {
                name = "+all files"
            })
        }),
        w = { c('w'), 'save file' },
        f = { c("CocCommand explorer"), "Explorer" },
        -- p = Merged in by fzfFileFind
        -- g = ----||------
        -- j = {},
        l = {
            name = "+Lazy",
            o = { c("Lazy home"), "Lazy home" },
            c = { c("Lazy check"), "Check for updates and show the log" },
            x = { c("Lazy clean"), "Clean plugins that are no longer needed" },
            e = { c("Lazy clear"), "Clear finished tasks" },
            d = { c("Lazy debug"), "Show debug info" },
            h = { c("Lazy health"), "Run :checkhealth lazy" },
            ["?"] = { c("Lazy help"), "Lazy help" },
            i = { c("Lazy install"), "Install missing plugins" },
            l = { c("Lazy log"), "Show recent updates" },
            p = { c("Lazy profile"), "Show detailed profiling" },
            s = { c("Lazy sync"), "Run install, clean and update" },
            t = { c("Lazy update"), "Update plugins. This will also update the lockfile" },
        },
        -- u = {  },
        y = {
            name = "+yank/put",
            R = { function() require('neoclip.fzf')("+") end, "Neoclip.fzf > system-clipboard" },
            r = { function() require('neoclip.fzf')() end, "Neoclip.fzf > default-register" },
            s = { function() vim.fn.setreg('"', vim.fn.getreg('+')) end, "System-clipboard > default-register" },
            S = { function() vim.fn.setreg('+', vim.fn.getreg('"')) end, "Default-register > system-clipboard" },
            b = { c("%y"), "Buffer contents > default-register" },
            f = { c("let @+=expand('%')"), "Filename > system-clipboard" },
            t = {
                name = "+tpaste",
                f = { c('w !curl --silent -F "tpaste=<-" https://tpaste.us | xclip -out -in -selection clipboard'),
                    "Buffer contents > tpaste.us" },
                v = { c("'<,'>w !curl --silent -F 'tpaste=<-' https://tpaste.us | xclip -out -in -selection clipboard"),
                    "Visually selected > tpaste.us" },
            },
        },
        [";"] = { h('fzf-lua', 'command_history'), "command history" },
        a = {},
        r = {
            name = "change cwd/ssh-agent",
            i = { h('afreak.utils.other', 'change_cwd_to_closest_git', function() return vim.fn.expand('%:p:h') end),
                "buffer" },
            o = { h('afreak.utils.other', 'change_cwd_to_closest_git', function() return vim.fn.getcwd() end),
                "parent of cwd" },
            s = { h('afreak.utils.other', 'toggle_SSH_AUTH_SOCK'), "toggle SSH_AUTH_SOCK" },
        },
        s = {
            name = "Session",
            w = { c("lua MiniSessions.write(vim.fn.input('Session name: '))"), "save session" },
            s = { c("lua MiniSessions.select()"), "open session" },
            d = { c("lua MiniSessions.select('delete')"), "delete session" },
            o = { c("lua MiniSessions.select('write', {force = true})"), "overwrite session" }
        },
        t = {
            name = '+git',
            t = { c('Git'), 'Status' },
            p = {
                name = "+push/pull",
                l = { c('Git pull'), 'Pull' },
                h = { c('Git push'), 'Push' },
            },
            h = {
                name = "+hunk",
                s = { c('Gitsigns stage_hunk'), "stage hunk" },
                r = { c('Gitsigns reset_hunk'), "reset hunk" },
                u = { h("gitsigns", 'undo_stage_hunk'), "undo stage hunk " },
                p = { h("gitsigns", 'preview_hunk'), "preview hunk" },
            },
            d = { c('Gdiffsplit'), 'split' },
            b = {
                name = "+blame",
                b = { c('Git blame'), 'blame' },
                l = { h('gitsigns', 'blame_line', { full = true }), "blame line" },
            },
            l = {
                name = "+log",
                l = { c('Git log'), 'log' },
                p = { h('fzf-lua', 'git_commits'), 'commit log (project)' },
                b = { h('fzf-lua', 'git_bcommits'), 'commit log (buffer)' },
            },
            o = { c('GBrowse'), 'browse' },
            w = { c('Gwrite'), 'write' },
            r = { c('Gread'), 'read' },
            a = { h('fzf-lua', 'git_branches'), 'checkout branch' },
            s = { h('fzf-lua', 'git_stash'), 'stash' },
            e = { h('gitsigns', 'toggle_deleted'), "toggle deleted" },
        },
        d = {
            name = '+debug(dap)',
            c = { h('dap', 'continue'), 'continue' },
            o = { h('dap', 'step_over'), 'step_over' },
            k = { h('dap', 'step_back'), 'step back' },
            i = { h('dap', 'step_into'), 'step_into' },
            O = { h('dap', 'step_out'), 'step_out' },
            b = { h('dap', 'toggle_breakpoint'), 'toggle_breakpoint' },
            B = { c("lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))"),
                'set_breakpoint(breakpoint condition)' },
            s = { c("lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))"),
                'set_breakpoint(log point message)' },
            r = { h('dap', 'repl.open'), 'repl open' },
            a = { h('dap', 'run_last'), 'run last' },
            l = { h('dap', 'list_breakpoints'), 'list breakpoints' },
            u = { h('dapui', 'toggle'), 'toggle ui' },
            f = { h('fzf-lua', 'dap_commands'), "fzf: list,run nvim-dap builtin commands" },
            n = { h('fzf-lua', 'dap_configurations'), "fzf: list,run debug configurations" },
            e = { h('fzf-lua', 'dap_breakpoints'), "fzf: list,delete breakpoints" },
            v = { h('fzf-lua', 'dap_variables'), "fzf: active session variables" },
            m = { h('fzf-lua', 'dap_frames'), "fzf: active session jump to frame" },
            q = { function()
                require('dap').clear_breakpoints()
                require('dap').set_exception_breakpoints({})
            end, "Removes all breakpoints" },
            x = { h('dap', 'set_exception_breakpoints'), "set exception breakpoint" },
        },
        h = {
            name = "+ChatGPT"
        },
        n = {
            name = "+Noice",
            l = { h("noice", 'cmd', "last"), "last message in a popup" },
            h = { h("noice", 'cmd', "history"), "message history" },
            e = { h("noice", 'cmd', "errors"), "error messages in a split. Last errors on top" },
            s = { h("noice", 'cmd', "stats"), "debugging stats" },
            t = { h("noice", 'cmd', "telescope"), "opens message history in Telescope" },

        },
        e = { h('fzf-lua', 'resume'), 'fzf resume last' },
        -- i = {},
        o = {
            name = '+tab/window',
            t = { c("tabe"), "tab new" },
            v = { c("vsplit"), "vertical split" },
            s = { c("split"), "horizontal split" },
            c = { c("tabclose"), "tab close" },
            o = { c("tabonly"), "tab only" },
            u = { c("+tabmove"), "tab up" },
            d = { c("-tabmove"), "tab down" },
            p = { function()
                vim.api.nvim_set_current_win(require('window-picker').pick_window() or
                vim.api.nvim_get_current_win())
            end, "Pick a window" }
        },
        z = {
            name = "+theme",
            d = { c('set background=dark'), "dark" },
            l = { c('set background=light'), "light" },
            t = { c('hi Normal guibg=NONE ctermbg=NONE'), "transparent" },
        },
        -- x = {},
        c = {
            name = "+coc",
            a = {
                name = "+actions",
                a = { p("coc-codeaction"), "codeaction" },
                l = { p("coc-codeaction-line"), "codeaction-line" },
                c = { p("coc-codeaction-cursor"), "codeaction-cursor" },
                v = { p("coc-codeaction-selected"), "codeaction-selected" },
                s = { p("coc-codelens-action"), "codelens-action" },
            },
            l = {
                name = "+coclists",
                l = { c("CocFzfList"), "List all list sources" },
                d = { c("CocFzfList diagnostics"), "diagnostics" },
                e = { c("CocFzfList extensions"), "extensions" },
                c = { c("CocFzfList commands"), "commands" },
                o = { c("CocFzfList outline"), "outline" },
                s = { c("CocFzfList symbols"), "symbols" },
                r = { c("CocFzfListResume"), "coclistresume" },
            },
            u = { c("CocCommand workspace.showOutput"), "workspace.showOutput" },
            r = { c("CocRestart"), "CocRestart" },
            g = {
                name = "+goto (also available as g* keys)",
                i = { p("coc-implementation"), "goto-implementation" },
                t = { p("coc-type-definition"), "goto-type-definition" },
                r = { p("coc-references"), "goto-references" },
                d = { p("coc-definition"), "goto-definition" },
            },
            e = { p("coc-rename"), "rename" },
            f = { p("coc-refactor"), "refactor" },
            d = {
                name = "+diagnostics enable/disable",
                e = { c('call coc#config("diagnostic.enable", 1)'), "diagnostic enable" },
                d = { c('call coc#config("diagnostic.enable", 0)'), "diagnostic disable" },
            },
            w = { c('call coc#float#close_all() '), "close all floating windows" },
        },
        v = fzfUtils.fzfFileFind({ cwd = '~/.config/nvim' }, {
            name = '+vimrc',
            q = fzfUtils.fzfGreps({ cwd = '~/.config/nvim' }, { name = "+relativeToNvimConfig" }),
            o = { c('so %'), "source this file" },
        }),
        b = {
            name = '+buffer',
            l = { h('fzf-lua', 'buffers'), "list" },
            o = { ":%bd <bar> e# <bar> bd#<CR> <bar>'\"", "only" },
        },
        k = {},
        m = {},
        [","] = {},
        ["."] = {},
        ["/"] = {}
    })
M.localLeaderMaps = {
    ["<space>"] = { function() print("hello") end, "hello" },
}
M.leaderMaps = {
    s = { h("substitute.range", "operator"), "replace text defined by motion1 over range defined by motion2" },
    ["ss"] = { h("substitute.range", "word"), "replace word under cursor, in the range given by motion" },
    w = {
        name = "+swap",
        w = { c("ISwapWith"), "ISwapWith" },
        a = { c("ISwap"), "ISwap" },
        n = { c("ISwapNode"), "ISwapNode" },
        i = { c("ISwapNodeWith"), "ISwapNodeWith" },
    },
}
M.x_leaderMaps = {
    s = { h("substitute.range", "visual"),
        "replace text defined by visual selection over range given by following motion" },
}
return M
