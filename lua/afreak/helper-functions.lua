function cmdAndGetFirstLine(cmd)
    local handle = io.popen(cmd)
    if handle ~= nil then
        local result = handle:read("*l")
        handle:close()
        return result
    end
    print("Error getting handle in cmdAndGetFirstLine")
    return ""
end

local qfisopen = 0
function Qftoggle()
    if qfisopen == 0 then
        vim.cmd("copen")
        qfisopen = 1
    else
        vim.cmd("cclose")
        qfisopen = 0
    end
end
