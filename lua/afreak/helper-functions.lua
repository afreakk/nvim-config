local M = {}
function M.cmdAndGetFirstLine(cmd)
    local handle = io.popen(cmd)
    if handle ~= nil then
        local result = handle:read("*l")
        handle:close()
        return result
    end
    print("Error getting handle in cmdAndGetFirstLine")
    return ""
end

return M
