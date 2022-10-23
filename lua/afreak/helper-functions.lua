function cmdAndGetFirstLine(cmd)
    local handle = io.popen(cmd)
    local result = handle:read("*l")
    handle:close()
    return result
end

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

local qfisopen = 0
function qfOpen()
    vim.cmd("copen")
    qfisopen = 1
end

function qfClose()
    vim.cmd("cclose")
    qfisopen = 0
end

function qftoggle()
    if qfisopen == 0 then
        qfOpen()
    else
        qfClose()
    end
end
