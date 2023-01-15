local yankGroup = vim.api.nvim_create_augroup("yankGroup", {})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = yankGroup,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
    end,
})

local timeAtNvimStartup = os.time()
local direnvLoaded = vim.api.nvim_create_augroup("direnvLoaded", {})
vim.api.nvim_create_autocmd("User", {
    group = direnvLoaded,
    pattern = "DirenvLoaded",
    callback = function()
        -- probably loaded some lsps, so restart coc
        -- but this event also starts at startup, so dont do it then..
        if os.difftime(os.time(), timeAtNvimStartup) > 1 then
            vim.cmd([[CocRestart]])
        end
    end,
})

local makeSplitsNiceAfterResize = vim.api.nvim_create_augroup("makeSplitsNiceAfterResize", {})
vim.api.nvim_create_autocmd("VimResized", {
    group = makeSplitsNiceAfterResize,
    pattern = "*",
    callback = function()
        vim.api.nvim_command("wincmd =")
    end,
})

local numberz = vim.api.nvim_create_augroup("numberz", {})
vim.api.nvim_create_autocmd("WinEnter", {
    group = numberz,
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = true
    end,
})
vim.api.nvim_create_autocmd("WinLeave", {
    group = numberz,
    pattern = "*",
    callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = true
    end,
})

local spelling = vim.api.nvim_create_augroup("spelling", {})
vim.api.nvim_create_autocmd("FileType", {
    group = spelling,
    pattern = { "markdown", "gitcommit" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

local jsStuff = vim.api.nvim_create_augroup("jsStuff", {})
vim.api.nvim_create_autocmd("FileType", {
    group = jsStuff,
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    callback = function(event)
        vim.cmd([[
         iabbrev <buffer> clg console.log()<left>
         iabbrev <buffer> cle console.error()<left>
         iabbrev <buffer> clw console.warning()<left>
         iabbrev <buffer> iff if ()<left>
         iabbrev <buffer> cc const
         iabbrev <buffer> rr return 
         iabbrev <buffer> prts propTypes = {}<left> 
        ]])
    end,
})
