local M = {}
local qfisopen = 0
function M.toggle()
    if qfisopen == 0 then
        vim.cmd.copen()
    else
        vim.cmd.cclose()
    end
end

vim.api.nvim_create_autocmd(
    "BufWinEnter",
    { pattern = { "quickfix" }, callback = function()
        qfisopen = 1
    end }
)
vim.api.nvim_create_autocmd(
    "BufWinLeave",
    { pattern = { "*" }, callback = function()
        qfisopen = 0
    end }
)
return M
