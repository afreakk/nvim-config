# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration repository (dotfiles for `~/.config/nvim`). It's a highly customized, modular Lua-based Neovim setup designed for professional development with support for 30+ programming languages via native LSP, advanced text navigation, fuzzy finding, git integration, and debugging capabilities. Runs on NixOS — language servers are provided via nix-shell/direnv rather than mason.nvim.

## Architecture

### Core Structure

The configuration follows a modular architecture:

```
init.lua (entry point)
├── Sets leader keys: ; (primary), \\ (local)
└── Loads core modules:
    ├── lazy.lua        - Plugin manager bootstrap
    ├── options.lua     - Editor settings
    └── autocmds.lua    - Event-driven automation

lua/afreak/
├── plugins/            - Feature-organized plugin configs (14 files)
├── mappings/           - Keybindings organized by mode (leader.lua, other.lua)
└── utils/              - Helper functions (other.lua, fzf.lua)
```

### Plugin Organization

Plugins are organized into logical categories in `lua/afreak/plugins/`:

- **ui.lua** - Visual/UI elements (tabby, lualine, noice, snacks)
- **lsp.lua** - Native LSP (nvim-lspconfig, blink.cmp, conform.nvim, nvim-lint, fidget.nvim)
- **fzf.lua** - Fuzzy finding and searching
- **treesitterAndTextObjects.lua** - Syntax highlighting and text navigation
- **movement.lua** - Advanced navigation (leap, flit, mini.move)
- **dap.lua** - Debugging (nvim-dap, nvim-dap-ui)
- **chatgpt.lua** - AI assistance (currently disabled; Avante stub)
- **whichKey.lua** - Key binding discovery
- **surround.lua** - Text surrounds manipulation
- **tpope.lua** - tpope plugins (fugitive, rhubarb, repeat, unimpaired)
- **neoclip.lua** - Clipboard manager
- **winshift.lua** - Window management
- **restOfPlugins.lua** - Miscellaneous utilities (neo-tree, oil, gitsigns, etc.)
- **filetypePlugins.lua** - File type-specific configurations

### Key Binding Architecture

Keybindings are organized by mode and prefix in `lua/afreak/mappings/`:

**leader.lua** (~250+ lines):
- `spaceMaps` - Nested menus under `<space>` (files, grep, git, LSP, etc.)
- `leaderMaps` - Direct `<leader>` (`;`) bindings
- `localLeaderMaps` - Local leader (`\\`) bindings
- `x_leaderMaps` - Visual mode leader bindings

**other.lua** (~110+ lines):
- `n_mappings` - Normal mode (window navigation, diagnostics, LSP goto)
- `x_mappings` - Visual mode
- `i_mappings` - Insert mode
- `c_mappings` - Command mode

### LSP and Language Support

**LSP Stack** (configured in `lua/afreak/plugins/lsp.lua`):
- **nvim-lspconfig** + Neovim 0.11 native `vim.lsp.config()` / `vim.lsp.enable()` APIs
- **blink.cmp** - Autocompletion (Tab/S-Tab/CR keybindings, lazydev source for Lua)
- **conform.nvim** - Formatting (Prettier, buildifier, nixpkgs-fmt)
- **nvim-lint** - Linting (shellcheck, markdownlint)
- **fidget.nvim** - LSP progress notifications
- **lazydev.nvim** - Lua development support

**Server Management**: Language servers are provided by nix-shell/direnv. `vim.lsp.enable()` silently skips servers not found in PATH.

Configured servers: lua_ls, ts_ls, gopls, pyright, rust_analyzer, clangd, jsonls, yamlls, cssls, dockerls, bashls, vimls, eslint, denols, phpactor, terraformls, fsautocomplete, csharp_ls, nil_ls, hls, elmls, graphql.

## Common Development Tasks

### Managing Plugins

All plugin management is done through Lazy.nvim (accessed via `<space>l`):

```vim
:Lazy home          " Open plugin manager UI
:Lazy check         " Check for plugin updates
:Lazy install       " Install missing plugins
:Lazy update        " Update all plugins
:Lazy clean         " Remove unused plugins
:Lazy sync          " Install, clean, and update in one command
:Lazy profile       " Show plugin load times
```

### Language Server Management

```vim
:LspRestart         " Restart LSP servers
:LspLog             " View LSP logs
:checkhealth lsp    " LSP health check
:ConformInfo        " Show formatter info
```

### Making Configuration Changes

1. **Adding a new plugin**: Create a new `{plugin-name}.lua` file in `lua/afreak/plugins/` or add to `restOfPlugins.lua`
2. **Adding keybindings**: Add to appropriate file in `lua/afreak/mappings/`
3. **Adjusting editor options**: Modify `lua/afreak/options.lua`
4. **Configuring LSP for a language**: Add `vim.lsp.config()` and `vim.lsp.enable()` calls in `lua/afreak/plugins/lsp.lua`

### Plugin Specification Format

All plugins follow Lazy.nvim spec with optional per-plugin configuration:

```lua
return {
  {
    "author/plugin-name",
    cmd = { "PluginCmd" },              -- Lazy load on command
    event = "VeryLazy",                 -- Lazy load on event
    keys = { keybinding },              -- Lazy load on keypress
    opts = { option = value },          -- Plugin options
    config = function(_, opts)          -- Optional config function
      require("plugin").setup(opts)
    end,
    dependencies = { "other/plugin" },  -- Plugin dependencies
  }
}
```

## Key Editor Settings

From `lua/afreak/options.lua`:

| Setting | Value | Purpose |
|---------|-------|---------|
| `mouse` | `'a'` | Mouse support in all modes |
| `number` | `true` | Show line numbers |
| `relativenumber` | `true` | Relative line numbering |
| `tabstop` / `shiftwidth` | `4` | 4-space indentation |
| `expandtab` | `true` | Use spaces instead of tabs |
| `termguicolors` | `true` | 24-bit RGB colors |
| `inccommand` | `"split"` | Preview `:s` replacements |
| `undofile` | `true` | Persistent undo across sessions |
| `ignorecase` + `smartcase` | Both `true` | Smart case-sensitive search |
| `cursorline` | `true` | Highlight current line |
| `updatetime` | `250` | Fast UI updates (affects plugins) |
| `signcolumn` | `'number'` | Merge gutter with line numbers |

## Diagnostic Notes

The codebase has Lua diagnostics warnings about undefined globals (`vim`). This is expected in Neovim plugins—the `vim` global is provided by Neovim at runtime. No action needed; the configuration works correctly despite the warnings.

## File Lock and Reproducibility

`lazy-lock.json` locks all plugin versions. This ensures reproducible builds across systems. To update plugin versions, use `:Lazy update` and commit the updated `lazy-lock.json`.

## Common File Locations

| What | Where |
|------|-------|
| Plugin configs | `lua/afreak/plugins/*.lua` |
| Keybindings | `lua/afreak/mappings/*.lua` |
| Editor options | `lua/afreak/options.lua` |
| LSP/completion/format config | `lua/afreak/plugins/lsp.lua` |
| Spellcheck files | `spell/` |
| Snippets | `vscodesnippets/` |
| Compiler configs | `compiler/` |

## Notes for Contributors

- **Lua style**: Uses Lua with Neovim API (`vim.*` namespace)
- **Formatting**: Plugins configured in `opts` tables; no external formatter currently set up
- **Dependencies**: All dependencies are managed via Lazy.nvim in `lazy-lock.json`
- **Testing**: No automated tests; changes are tested interactively in Neovim
- **Modular approach**: Keep related functionality in single files; split only when a file exceeds ~100 lines
