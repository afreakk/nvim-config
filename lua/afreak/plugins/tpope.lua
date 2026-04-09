return {
    { "tpope/vim-dispatch",  cmd = { "Dispatch", "Focus", "Make", "Start" } },
    { "tpope/vim-repeat",    event = "BufReadPre" },
    { "tpope/vim-fugitive", event = "VeryLazy",
        config = function()
            -- Workaround: completion autotrigger can invoke fugitive#Complete on :G,
            -- which scans every PATH dir for git-* via glob() — 3+ seconds on NixOS.
            -- We replace subcommand completion with `git --list-cmds` (fast, C impl)
            -- and delegate argument/flag completion to the original.
            local subcmds = {}

            local function complete(lead, line, pos)
                if line:sub(1, pos):match('%u%w*%s+%S+%s') or lead:match('^[+-]') then
                    return vim.fn['fugitive#Complete'](lead, line, pos)
                end
                return vim.tbl_filter(function(c) return vim.startswith(c, lead) end, subcmds)
            end

            local function cmd(opts)
                vim.cmd(vim.fn['fugitive#Command'](
                    opts.line1, opts.count, opts.range,
                    opts.bang and 1 or 0, opts.mods, opts.args
                ))
            end

            vim.schedule(function()
                local cmd_opts = { bang = true, nargs = '?', range = -1, complete = complete }
                vim.api.nvim_create_user_command('G', cmd, cmd_opts)
                vim.api.nvim_create_user_command('Git', cmd, cmd_opts)
            end)

            vim.system({ 'git', '--list-cmds=main,others,alias' }, { text = true },
                vim.schedule_wrap(function(obj)
                    if obj.code == 0 and obj.stdout then
                        for c in obj.stdout:gmatch('[^\n]+') do
                            subcmds[#subcmds + 1] = c
                        end
                    end
                end))
        end,
        dependencies = {
            "tpope/vim-rhubarb",
        },
    },
}
