local M = {}

M.toggle = function()
    for _, win in pairs(vim.fn.getwininfo()) do
        if win['quickfix'] == 1 then
            vim.cmd.cclose()
            return
        end
    end
    vim.cmd.copen()
end

return M
