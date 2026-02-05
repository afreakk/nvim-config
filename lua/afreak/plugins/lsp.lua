return {
    -- Mason: manages LSP servers, linters, formatters
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            automatic_enable = true,
        },
    },
    -- LSP configuration
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "folke/lazydev.nvim", ft = "lua", opts = {} },
        },
        config = function()
            -- Diagnostic configuration (matching your old coc diagnostic signs)
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.INFO] = "",
                        [vim.diagnostic.severity.HINT] = "",
                    },
                },
                virtual_text = true,
            })

            -- Document highlight on CursorHold (replaces coc-highlight)
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client and client.supports_method("textDocument/documentHighlight") then
                        local group = vim.api.nvim_create_augroup("LspDocHighlight_" .. args.buf, { clear = true })
                        vim.api.nvim_create_autocmd("CursorHold", {
                            group = group,
                            buffer = args.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })
                        vim.api.nvim_create_autocmd("CursorMoved", {
                            group = group,
                            buffer = args.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })

            -- :Format command (uses conform with LSP fallback)
            vim.api.nvim_create_user_command("Format", function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end, {})

            -- Server-specific configurations
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = { globals = { 'vim' } },
                    },
                },
            })

            vim.lsp.config('yamlls', {
                settings = {
                    yaml = {
                        format = { enable = true },
                        schemaStore = { enable = true },
                        schemas = {
                            ["https://json.schemastore.org/kustomization.json"] = {
                                "kustomization.yaml",
                                "kustomization.yml",
                            },
                        },
                    },
                },
            })

            -- Prevent denols and ts_ls from conflicting
            vim.lsp.config('denols', {
                root_markers = { "deno.json", "deno.jsonc" },
                settings = {
                    deno = {
                        documentPreloadLimit = 20000000000,
                    },
                },
            })

            vim.lsp.config('ts_ls', {
                root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
            })

            -- Custom language servers (provided by nix/system, not mason)
            vim.lsp.config('fsautocomplete', {
                cmd = { "fsautocomplete" },
                filetypes = { "fsharp" },
                root_markers = { "*.fsproj", "*.sln" },
                settings = {
                    FSharp = {
                        keywordsAutocomplete = true,
                        ExternalAutocomplete = false,
                        Linter = true,
                        UnionCaseStubGeneration = true,
                        UnionCaseStubGenerationBody = 'failwith "Not Implemented"',
                        RecordStubGeneration = true,
                        RecordStubGenerationBody = 'failwith "Not Implemented"',
                        InterfaceStubGeneration = true,
                        InterfaceStubGenerationObjectIdentifier = "this",
                        InterfaceStubGenerationMethodBody = 'failwith "Not Implemented"',
                        UnusedOpensAnalyzer = true,
                        UnusedDeclarationsAnalyzer = true,
                        UseSdkScripts = true,
                        SimplifyNameAnalyzer = false,
                        ResolveNamespaces = true,
                        EnableReferenceCodeLens = true,
                    },
                },
            })

            vim.lsp.config('csharp_ls', {
                cmd = { "csharp-ls" },
                filetypes = { "cs" },
                root_markers = { "*.sln" },
            })

            vim.lsp.config('nil_ls', {
                cmd = { "nil" },
                filetypes = { "nix" },
                root_markers = { "flake.nix" },
            })

            vim.lsp.config('hls', {
                cmd = { "haskell-language-server-wrapper", "--lsp" },
                filetypes = { "haskell", "lhaskell" },
                root_markers = { "*.cabal", "stack.yaml", "cabal.project", "package.yaml" },
                settings = {
                    haskell = {
                        hlintOn = true,
                        maxNumberOfProblems = 10,
                        completionSnippetsOn = true,
                    },
                },
            })

            vim.lsp.config('elmls', {
                cmd = { "elm-language-server" },
                filetypes = { "elm" },
                root_markers = { "elm.json" },
                init_options = {
                    elmFormatPath = "elm-format",
                    elmTestPath = "elm-test",
                    elmReviewPath = "elm-review",
                },
            })

            vim.lsp.config('graphql', {
                cmd = { "graphql-lsp", "server", "-m", "stream" },
                filetypes = { "graphql" },
            })

            -- Enable servers that are provided by nix/system (not installed via mason)
            vim.lsp.enable({
                'fsautocomplete',
                'csharp_ls',
                'nil_ls',
                'hls',
                'elmls',
                'graphql',
            })
        end,
    },
    -- Autocompletion (replaces coc's built-in completion)
    {
        'saghen/blink.cmp',
        version = '1.*',
        dependencies = { 'rafamadriz/friendly-snippets' },
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'none',
                ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
                ['<S-Down>'] = { 'scroll_documentation_down', 'fallback' },
                ['<S-Up>'] = { 'scroll_documentation_up', 'fallback' },
            },
            appearance = {
                nerd_font_variant = 'mono',
            },
            completion = {
                documentation = { auto_show = true },
            },
            sources = {
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
    },
    -- Formatting (replaces coc-prettier, buildifier, nixpkgs-fmt)
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                starlark = { "buildifier" },
                nix = { "nixpkgs_fmt" },
            },
            format_on_save = {
                timeout_ms = 3000,
                lsp_format = "fallback",
            },
            formatters = {
                prettier = {
                    prepend_args = { "--tab-width", "4", "--single-quote" },
                },
            },
        },
    },
    -- Linting (replaces coc-diagnostic with shellcheck, markdownlint)
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                sh = { "shellcheck" },
                markdown = { "markdownlint" },
            }
            -- Disable line_length rule for markdownlint (matching old coc config)
            lint.linters.markdownlint.args = {
                "--disable", "MD013", "--",
            }
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
    -- LSP progress notifications
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
}
