local M = {}
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
    end
    return arg

end

M.h = function(module, funcName, arg)
    return function()
        require(module)[funcName](M.resolveArg(arg))
    end
end

M.c = function(cmd)
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
M.p = function(plugCmd)
    return "<Plug>(" .. plugCmd .. ")"
end
return M
