local dap = require('dap')
local base_path = os.getenv('HOME') .. '/daps'
require("dapui").setup()
-- dap.defaults.fallback.external_terminal = {
--   command = 'terminal.sh'
-- }
dap.set_log_level('debug')
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
  type = 'executable';
  command = 'node';
  args = { base_path .. '/vscode-go/dist/debugAdapter.js' };
}
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Launch",
    request = "launch",
    program = "${file}",
    dlvToolPath = vim.fn.exepath('dlv'),
  },
  {
    type = "go",
    name = "Launch with args",
    request = "launch",
    program = "${workspaceFolder}",
    args = { "serve", "all", "--dangerous-force-http", "--config", "config.yml" },
    dlvToolPath = vim.fn.exepath('dlv')
  },
  {
    dlvToolPath = vim.fn.exepath('dlv'),
    type = "go",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages
  {
    dlvToolPath = vim.fn.exepath('dlv'),
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  },
  {
    dlvToolPath = vim.fn.exepath('dlv'),
    type = "go",
    name = "attach",
    request = "attach",
    pid = require('dap.utils').pick_process,
  }
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
