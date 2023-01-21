return {
    { "afreakk/coc-cspell-dicts", build = 'yarn install && yarn build' },
    { 'neoclide/coc.nvim', branch = 'release',
        config = function()
            function _G.check_back_space()
                local col = vim.fn.col('.') - 1
                return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
            end

            function _G.show_docs()
                local cw = vim.fn.expand('<cword>')
                if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
                    vim.api.nvim_command('h ' .. cw)
                elseif vim.api.nvim_eval('coc#rpc#ready()') then
                    vim.fn.CocActionAsync('doHover')
                else
                    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
                end
            end

            vim.g.coc_global_extensions = {
                "coc-explorer",
                "coc-clangd",
                "coc-css",
                "coc-eslint",
                "coc-fsharp",
                "coc-json",
                "coc-docker",
                "coc-yaml",
                "coc-phpls",
                "coc-prettier",
                "coc-diagnostic",
                "coc-python",
                "coc-rls",
                "coc-tsserver",
                "coc-vimlsp",
                "coc-go",
                "coc-highlight",
                "coc-spell-checker",
                "coc-sh",
                "coc-snippets",
                "coc-pairs",
                "coc-sumneko-lua",
            }
            vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
            -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
            local cocGroup = vim.api.nvim_create_augroup("CocGroup", {})
            vim.api.nvim_create_autocmd("CursorHold", {
                group = cocGroup,
                command = "silent call CocActionAsync('highlight')",
                desc = "Highlight symbol under cursor on CursorHold"
            })
        end }
}
