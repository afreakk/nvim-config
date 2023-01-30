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
    local closestGitRootFile = vim.fn.fnamemodify(vim.fn.findfile(".git", relativeTo .. ';'), ':h')
    local closestGitRoot = vim.fn.fnamemodify(vim.fn.finddir(".git", relativeTo .. ';'), ':h')
    local cwd
    if string.len(closestGitRoot) > string.len(closestGitRootFile) then
        cwd = closestGitRoot
    else
        cwd = closestGitRootFile
    end
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
M.plug = function(plugCmd)
    return "<Plug>(" .. plugCmd .. ")"
end
return M
