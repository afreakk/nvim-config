local M = {}
M.toggle_SSH_AUTH_SOCK = function()
    -- Would be nice if we could handle stderr differently than stdout,
    -- but the stderr output is atleast not a readable file, so we can use that to differentiate.
    local newSocket = vim.fn.system("toggleSSHSocketPath"):sub(1, -2)
    if vim.fn.filereadable(newSocket) == 1 then
        vim.env.SSH_AUTH_SOCK = newSocket
        print("Changed $SSH_AUTH_SOCK to:", vim.env.SSH_AUTH_SOCK)
    else
        vim.api.nvim_err_writeln("Can't change $SSH_AUTH_SOCK: " .. newSocket)
    end
end
M.change_cwd_to_closest_git = function(relativeTo)
    local search = relativeTo .. ";"
    local git_file = vim.fn.findfile(".git", search)
    local git_dir = vim.fn.finddir(".git", search)
    -- Normalize to absolute paths so length comparison reflects actual depth
    if git_file ~= "" then git_file = vim.fn.fnamemodify(git_file, ":p") end
    if git_dir ~= "" then git_dir = vim.fn.fnamemodify(git_dir, ":p") end
    -- Pick the deeper (closer) result
    local result = #git_file > #git_dir and git_file or git_dir
    if result == "" then
        vim.api.nvim_err_writeln("No .git found above " .. relativeTo)
        return
    end
    local cwd = vim.fn.fnamemodify(result, ":h")
    print("changed cwd to: " .. cwd)
    vim.api.nvim_set_current_dir(cwd)
end

M.resolveArg = function(arg)
    if type(arg) == 'function' then
        return arg()
    elseif type(arg) == 'table' then
        -- hmm sometimes fzf.search seems to be mutated by a previous command, so maybe just always clone it
        return vim.deepcopy(arg)
    end
    return arg
end

M.functionHelper = function(module, funcName, arg)
    return function()
        require(module)[funcName](M.resolveArg(arg))
    end
end

M.cmd = function(cmd)
    return "<cmd>" .. cmd .. "<CR>"
end
M.qfToggle = function()
    for _, win in pairs(vim.fn.getwininfo()) do
        if win['quickfix'] == 1 then
            return vim.cmd.cclose()
        end
    end
    vim.cmd.copen()
end

return M
