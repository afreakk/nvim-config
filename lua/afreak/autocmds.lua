local numberz = vim.api.nvim_create_augroup("numberz", {})
vim.api.nvim_create_autocmd("WinEnter", {
    group = numberz,
    pattern = "*",
    callback = function()
        vim.opt_local.relativenumber = true
    end,
})
vim.api.nvim_create_autocmd("WinLeave", {
    group = numberz,
    pattern = "*",
    callback = function()
        vim.opt_local.relativenumber = false
    end,
})

local function auCmdGrp(event, grpName, pattern, callback)
    vim.api.nvim_create_autocmd(event, {
        group = vim.api.nvim_create_augroup(grpName, {}),
        pattern = pattern,
        callback = callback,
    })
end

auCmdGrp("TextYankPost", "yankGroup", "*", function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
end)

auCmdGrp("VimResized", "makeSplitsNiceAfterResizeGroup", "*", function()
    vim.api.nvim_command("wincmd =")
end)

local function ftAuCmdGrp(grpName, pattern, callback)
    auCmdGrp("FileType", grpName, pattern, callback)
end

ftAuCmdGrp("spellingGroup", { "markdown", "gitcommit" }, function()
    vim.opt_local.spell = true
end)

ftAuCmdGrp("javascriptGroup", { "javascript", "javascriptreact", "typescript", "typescriptreact" }, function()
    vim.cmd([[
         iabbrev <buffer> clg console.log()<left>
         iabbrev <buffer> cle console.error()<left>
         iabbrev <buffer> clw console.warning()<left>
         iabbrev <buffer> iff if ()<left>
         iabbrev <buffer> cc const
         iabbrev <buffer> rr return
         iabbrev <buffer> prts propTypes = {}<left>
        ]])
end)

ftAuCmdGrp("haskellGroup", "haskell", function()
    vim.cmd([[compiler haskell]])
end)

-- set titlestring to cwd initially also
vim.opt.titlestring = vim.fn.getcwd()
auCmdGrp("DirChanged", "dirChangedGroup", "*", function()
    vim.opt.titlestring = vim.fn.getcwd()
    -- source direnv/nix-shell
    vim.api.nvim_command(":DirenvExport")
end)

auCmdGrp("User", "direnvLoadedGroup", "DirenvLoaded", function()
    -- restart LSP servers as we now probably have new ones from nix-shell
    vim.api.nvim_command(":LspRestart")
end)
