return { 'folke/which-key.nvim', config = function()
  local wk = require('which-key')
  wk.setup {}
  local spaceMaps = {
    q = {
      name = "+fzf",
      g = { "<cmd>lua require('fzf-lua').grep()<CR>", "run search for a pattern" },
      l = { "<cmd>lua require('fzf-lua').grep_last()<CR>", "run search again with the last pattern" },
      W = { "<cmd>lua require('fzf-lua').grep_cWORD()<CR>", "search WORD under cursor" },
      w = { "<cmd>lua require('fzf-lua').grep_cword()<CR>", "search word under cursor" },
      v = { "<cmd>lua require('fzf-lua').grep_visual()<CR>", "search visual selection" },
      p = { "<cmd>lua require('fzf-lua').grep_project()<CR>", "search all project lines" },
      b = { "<cmd>lua require('fzf-lua').grep_curbuf()<CR>", "grep current buffer" },
      h = { "<cmd>lua require('fzf-lua').search_history()<CR>", "search history" },
      j = { "<cmd>lua require('fzf-lua').jumps()<CR>", ":jumps" },
      c = { "<cmd>lua require('fzf-lua').changes()<CR>", ":changes" },
      s = { "<cmd>lua require('fzf-lua').spell_suggest()<CR>", "Spelling suggestions" },
    },
    w = { ':w<CR>', 'save file' },
    f = { ":CocCommand explorer<CR>", "Explorer" },
    p = { "<cmd>lua require('fzf-lua').files()<CR>", "Files" },
    g = { "<cmd>lua require('fzf-lua').git_files()<CR>", "Git files" },
    j = {},
    l = {
      name = "+coclists",
      l = { ":<C-u>CocFzfList<cr>", "List all list sources" },
      -- Show all diagnostics
      d = { ":<C-u>CocFzfList diagnostics<cr>", "diagnostics" },
      -- Manage extensions
      e = { ":<C-u>CocFzfList extensions<cr>", "extensions" },
      -- Show commands
      c = { ":<C-u>CocFzfList commands<cr>", "commands" },
      -- Find symbol of current document
      o = { ":<C-u>CocFzfList outline<cr>", "outline" },
      -- Search workspace symbols
      s = { ":<C-u>CocFzfList symbols<cr>", "symbols" },
      -- Resume latest coc list
      r = { ":<C-u>CocFzfListResume<CR>", "coclistresume" },
      u = { ":<C-u>CocCommand workspace.showOutput<CR>", "coccommand workspace.showOutput" },
    },
    u = { ':UndotreeToggle<CR>', 'Undotree toggle' },
    y = {
      name = "+yank",
      f = { ":%y<CR>", "content of buffer" },
      n = { ":let @+=expand('%')<CR>", "filename" },
      t = {
        name = "+tpaste",
        f = { ":!cat % | curl -F 'tpaste=<-' https://tpaste.us<CR>", "file to tpaste" },
        v = { ":'<,'>:w !curl -F 'tpaste=<-' https://tpaste.us<CR>", "visually selected to tpaste" },
      },
    },
    [";"] = { "<cmd>lua require('fzf-lua').command_history()<CR>", "command history" },
    a = {},
    r = {},
    s = {}, --used for subversive
    t = {
      name = '+git',
      s = { ':Git<CR>', 'Status' },
      p = { ':Git pull<CR>', 'Pull' },
      h = { ':Git push<CR>', 'Push' },
      d = { ':Gdiffsplit<CR>', 'split' },
      b = { ':Git blame<CR>', 'blame' },
      l = { ':Gclog<CR>', 'log' },
      o = { ':GBrowse<CR>', 'browse' },
      w = { ':Gwrite<CR>', 'write' },
      r = { ':Gread<CR>', 'read' },
      a = { "<cmd>lua require('fzf-lua').git_branches()<CR>", 'checkout branch' },
      t = { "<cmd>lua require('fzf-lua').git_stash()<CR>", 'stash' },
      c = { "<cmd>lua require('fzf-lua').git_commits()<CR>", 'commit log (project)' },
      u = { "<cmd>lua require('fzf-lua').git_bcommits()<CR>", 'commit log (buffer)' },
    },
    d = {
      name = '+debug(dap)',
      c = { "<Cmd>lua require'dap'.continue()<CR>", 'continue' },
      o = { "<Cmd>lua require'dap'.step_over()<CR>", 'step_over' },
      k = { "<Cmd>lua require'dap'.step_back()<CR>", 'step back' },
      i = { "<Cmd>lua require'dap'.step_into()<CR>", 'step_into' },
      O = { "<Cmd>lua require'dap'.step_out()<CR>", 'step_out' },
      b = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", 'toggle_breakpoint' },
      B = { "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        'set_breakpoint(breakpoint condition)' },
      s = { "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
        'set_breakpoint(log point message)' },
      r = { "<Cmd>lua require'dap'.repl.open()<CR>", 'repl open' },
      a = { "<Cmd>lua require'dap'.run_last()<CR>", 'run last' },
      l = { "<Cmd>lua require'dap'.list_breakpoints()<CR>", 'list breakpoints' },
      u = { "<Cmd>lua require'dapui'.toggle()<CR>", 'toggle ui' },
      f = { "<cmd>lua require('fzf-lua').dap_commands()<CR>", "fzf: list,run nvim-dap builtin commands" },
      n = { "<cmd>lua require('fzf-lua').dap_configurations()<CR>", "fzf: list,run debug configurations" },
      e = { "<cmd>lua require('fzf-lua').dap_breakpoints()<CR>", "fzf: list,delete breakpoints" },
      v = { "<cmd>lua require('fzf-lua').dap_variables()<CR>", "fzf: active session variables" },
      m = { "<cmd>lua require('fzf-lua').dap_frames()<CR>", "fzf: active session jump to frame" },
    },
    h = {},
    n = { ":noh<cr> ", "nohilight" },
    e = { "<cmd>lua require('fzf-lua').resume()<CR>", 'fzf resume last' },
    i = {
      name = "+diff",
      e = { ":diffthis<cr>", "diffthis" },
      d = { ":diffoff<cr>", "diffoff" },
      o = { ":diffoff!<cr>", "diffoff!" },
      w = { ":windo diffthis<cr>", "windo diffthis" },
    },
    o = {},
    z = {
      name = "+theme",
      d = { ":set background=dark<CR>", "dark" },
      l = { ":set background=light<CR>", "light" },
      t = { ":hi Normal guibg=NONE ctermbg=NONE<CR>", "transparent" },
    },
    x = { function()
      for _, win in pairs(vim.fn.getwininfo()) do
        if win['quickfix'] == 1 then
          return vim.cmd.cclose()
        end
      end
      vim.cmd.copen()
    end, "quickfixtoggle" },
    c = {
      name = "+coc-actions",
      l = { "<Plug>(coc-codeaction-line)", "codeaction-line" },
      a = { "<Plug>(coc-codeaction)", "codeaction" },
      c = { "<Plug>(coc-codeaction-cursor)", "codeaction-cursor" },
      v = { "<Plug>(coc-codeaction-selected)", "codeaction-selected" },
      s = { "<Plug>(coc-codelens-action)", "codelens-action" },
      n = { "<Plug>(coc-diagnostic-next)", "diagnostic-next" },
      p = { "<Plug>(coc-diagnostic-prev)", "diagnostic-prev" },

      i = { "<Plug>(coc-implementation)", "goto-implementation" },
      t = { "<Plug>(coc-type-definition)", "goto-type-definition" },
      r = { "<Plug>(coc-references)", "goto-references" },
      d = { "<Plug>(coc-definition)", "goto-definition" },

      e = { "<Plug>(coc-rename)", "rename" },
      f = { "<Plug>(coc-refactor)", "refactor" },
      g = {
        name = "+diagnostics enable/disable",
        d = { ":<c-u>call coc#config('diagnostic.enable', 0)<cr>", "diagnostic enable" },
        e = { ":<c-u>call coc#config('diagnostic.enable', 1)<cr>", "diagnostic disable" },
      },
      w = { ":<c-u>call coc#float#close_all() <CR>", "close all floating windows" },
    },
    v = {
      name = '+vimrc',
      e = { ":vsplit $MYVIMRC<CR>", "edit vimrc" },
      g = { "<cmd>lua require('fzf-lua').files({cwd = '~/.config/nvim'})<CR>", "find vim file" },
      s = { ":Reload<cr>", "nvim-reload" },
      q = { "<cmd>lua require('fzf-lua').grep({cwd = '~/.config/nvim'})<CR>", "find in vim files" },
      o = { ":so %<cr>", "source this file" },
    },
    b = {
      name = '+buffer',
      l = { "<cmd>lua require('fzf-lua').buffers()<CR>", "list" },
      o = { ":%bd <bar> e# <bar> bd#<CR> <bar>'\"", "only" },
    },
    k = {},
    m = {},
    [","] = {},
    ["."] = {},
    ["/"] = {},
    ["<space>"] = { function()
      require('legendary').find({ filters = { require('legendary.filters').current_mode() } })
    end, "legendary" },
  }
  wk.register(spaceMaps, { prefix = " ", mode = "n" })
  wk.register(spaceMaps, { prefix = " ", mode = "v" })
  -- local leaderkeymap = {
  -- }
  -- wk.register(leaderkeymap, { prefix = '<leader>' })
  --
  -- local local_keymap = {
  -- }
  --
  -- wk.register(local_keymap, { prefix = '<localleader>' })
end
}