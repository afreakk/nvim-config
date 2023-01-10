return {
    { 'jackMort/ChatGPT.nvim',
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
        keys = {
            { "<space>hh", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
            { "<space>ha", "<cmd>ChatGPTActAs<CR>", desc = "ChatGPTActAs" },
            { "<space>hi", "<cmd>ChatGPTEditWithInstructions<CR>", desc = "ChatGPTEditWithInstructions",
                mode = { "n", "x" } },
        },
        config = function()
            require("chatgpt").setup({
                -- optional configuration
            })
        end
    }
}
