function cmdAndGetFirstLine(cmd)
  local handle = io.popen(cmd)
  local result = handle:read("*l")
  handle:close()
  return result
end

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end
