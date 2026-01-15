return {
    { "afreakk/coc-cspell-dicts", build = 'yarn install && yarn build' },
    {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function()
            vim.g.coc_global_extensions = {
                "coc-explorer",
                "coc-clangd",
                "coc-css",
                "coc-eslint",
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
                "coc-deno",
                -- "coc-snippets",
                -- "coc-pairs",
                "coc-sumneko-lua",
                "coc-markdownlint",
                "coc-fsharp",
            }
            vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
            -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
            local cocGroup = vim.api.nvim_create_augroup("CocGroup", {})
            vim.api.nvim_create_autocmd("CursorHold", {
                group = cocGroup,
                command = "silent call CocActionAsync('highlight')",
                desc = "Highlight symbol under cursor on CursorHold"
            })
        end
    }
}
