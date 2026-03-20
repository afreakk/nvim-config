return {
    {
        "Cannon07/claude-preview.nvim",
        cmd = { "ClaudePreviewInstallHooks", "ClaudePreviewUninstallHooks", "ClaudePreviewCloseDiff", "ClaudePreviewStatus" },
        keys = {
            { "<leader>dq", false },
        },
        config = function()
            require("claude-preview").setup({
                diff = {
                    layout = "tab",
                    auto_close = true,
                    equalize = true,
                    full_file = true,
                },
            })
        end,
    },
    {
        "wasabeef/yank-for-claude.nvim",
        keys = {
            { "<space>ky", function() require("yank-for-claude").yank_visual_with_content() end, mode = "v", desc = "Yank @ref + code" },
            { "<space>ky", function() require("yank-for-claude").yank_line_with_content() end, mode = "n", desc = "Yank @ref + code" },
            { "<space>kY", function() require("yank-for-claude").yank_visual() end, mode = "v", desc = "Yank @ref only" },
            { "<space>kY", function() require("yank-for-claude").yank_line() end, mode = "n", desc = "Yank @ref only" },
        },
        opts = {},
    },
}
