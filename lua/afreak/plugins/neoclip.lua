return {
    "AckslD/nvim-neoclip.lua",
    event = "BufReadPost",
    config = function()
        require('neoclip').setup({
            -- doesnt support fzf, and probably not superusefull for me
            enable_macro_history = false,
            filter = function(yankItem)
                -- print(vim.inspect(yankItem))
                -- dont save deleted stuff, they have their own register "1-9
                return yankItem.event.operator ~= "d"
            end
        })
    end,
}
