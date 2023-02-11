return {
    { 'tpope/vim-unimpaired', key = { "[", "]", "y", "=", "<", ">" }, config = function()
        local decoders = {
            u = "URL",
            x = "XML",
            C = "C String",
            y = "C String",
        }
        local wk = require("which-key")
        for k, decoderName in pairs(decoders) do
            wk.register({
                ["[" .. k] = { decoderName .. " encode" },
                ["[" .. k .. k] = { decoderName .. " encode line" },
                ["]" .. k] = { decoderName .. " decode" },
                ["]" .. k .. k] = { decoderName .. " decode line" },
            }, { mode = { "n", "v" } })
        end
    end },
    {
        "tpope/vim-dispatch",
        cmd = { "Dispatch", "Focus", "Make", "Start" },
    },
    {
        "tpope/vim-repeat",
        event = "BufReadPre",
    },
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git", "GBrowse" },
        dependencies = {
            "tpope/vim-rhubarb",
        },
    },
}
