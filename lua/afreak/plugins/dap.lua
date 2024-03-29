return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "rcarriga/nvim-dap-ui",
            config = function()
                require("dapui").setup()
            end,
        },
    },
    lazy = true,
    config = function()
        local dap = require('dap')
        local base_path = vim.fn.stdpath("data") .. '/daps'
        require("dapui").setup()
        -- dap.defaults.fallback.external_terminal = {
        --   command = 'terminal.sh'
        -- }
        dap.set_log_level('trace')
        dap.adapters.php = {
            type = 'executable',
            command = 'node',
            args = { base_path .. '/vscode-php-debug/out/phpDebug.js' }
        }

        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = 9000
            }
        }

        dap.adapters.go = {
            type = 'executable',
            command = 'node',
            args = { base_path .. '/vscode-go/dist/debugAdapter.js' },
        }
        -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
        dap.configurations.go = {
            -- {
            --     type = "go",
            --     name = "Launch with args",
            --     request = "launch",
            --     program = "${workspaceFolder}",
            --     args = { "serve", "all", "--dangerous-force-http", "--config", "config.yml" },
            --     dlvToolPath = vim.fn.exepath('dlv')
            -- },
            {
                type = "go",
                name = "Test", -- configuration for debugging test files
                request = "launch",
                mode = "test",
                program = "${file}"
            },
            -- works with go.mod packages and sub packages
            {
                type = "go",
                name = "Test (go.mod)",
                request = "launch",
                mode = "test",
                program = "./${relativeFileDirname}"
            },
            {
                type = 'go',
                name = 'Launch',
                request = 'launch',
                showLog = false,
                program = "${file}",
                dlvToolPath = vim.fn.exepath('dlv')
            },
            {
                type = 'go',
                name = 'Attach',
                request = 'attach',
                showLog = true,
                processId = require('dap.utils').pick_process,
                dlvToolPath = vim.fn.exepath('dlv')
            },
        }

        dap.adapters.node2 = {
            type = 'executable',
            command = 'node',
            args = { base_path .. '/vscode-node-debug2/out/src/nodeDebug.js' },
        }
        dap.configurations.javascript = {
            {
                type = 'node2',
                request = 'launch',
                program = '${file}',
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = 'inspector',
                console = 'integratedTerminal',
            },
        }
        dap.configurations.typescript = {
            {
                type = 'node2',
                request = 'launch',
                program = '${workspaceFolder}',
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = 'inspector',
                console = 'integratedTerminal',
            },
        }
        vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
    end
}
