return {
    {
        'jackMort/ChatGPT.nvim',
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup({
                -- todo something different for this
                api_key_cmd = "cat /home/afreak/random/openai_api_key",
                openai_params = {
                    model = "gpt-4",
                },
                openai_edit_params = {
                    model = "gpt-4",
                },
            })
        end
    }
}
