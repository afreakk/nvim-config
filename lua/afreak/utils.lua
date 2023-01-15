local M = {}
M.map = function(mode, mappings, opts)
    for lhs, rhs in pairs(mappings) do
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end
return M
