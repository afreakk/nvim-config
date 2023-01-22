local M = {}
local h = require('afreak.utils.other').functionHelper

-- TODO: follow https://github.com/neovim/neovim/issues/14157 for better ways of doing this
-- from this: https://github.com/neovim/nvim-lspconfig/wiki/User-contributed-tips#range-formatting-with-a-motion
M.fzfGrepTextObject = function(opts)
    local old_func = vim.go.operatorfunc
    _G.op_func_formatting = function(a)
        local startRow, startCol = unpack(vim.api.nvim_buf_get_mark(0, '['))
        local endRow, endCol = unpack(vim.api.nvim_buf_get_mark(0, ']'))
        local searchPattern
        if a == "char" then
            searchPattern = vim.api.nvim_buf_get_text(0, startRow - 1, startCol, endRow - 1, endCol + 1, {})
        elseif a == "line" then
            searchPattern = vim.api.nvim_buf_get_lines(0, startRow - 1, endRow, false)
        end
        vim.go.operatorfunc = old_func
        _G.op_func_formatting = nil
        if type(searchPattern) == "table" then
            searchPattern = table.concat(searchPattern, "\n")
        end
        require('fzf-lua').grep(vim.tbl_extend("error", opts, { search = searchPattern }))
    end
    vim.go.operatorfunc = 'v:lua.op_func_formatting'
    vim.api.nvim_feedkeys('g@', 'n', false)
end

M.fzfGreps = function(opts, restOfTable)
    return vim.tbl_extend("error", {
        t = { h('afreak.utils.fzf', 'fzfGrepTextObject', opts), "search for textobject" },
        g = { h('fzf-lua', 'grep', opts), "run search for a pattern" },
        W = { h('fzf-lua', 'grep_cWORD', opts), "search WORD under cursor" },
        w = { h('fzf-lua', 'grep_cword', opts), "search word under cursor" },
        v = { h('fzf-lua', 'grep_visual', opts), "search visual selection" },
        l = { h('fzf-lua', 'grep_last', opts), "run search again with the last pattern" },
        p = { h('fzf-lua', 'grep_project', opts), "search all project lines" },
        b = { h('fzf-lua', 'grep_curbuf', opts), "grep current buffer" },
    }, restOfTable)
end

M.fzfFileFind = function(opts, restOfTable)
    return vim.tbl_extend("error", {
        p = { h('fzf-lua', 'files', opts), "Files" },
        g = { h('fzf-lua', 'git_files', opts), "Git files" },
    }, restOfTable)
end

return M
