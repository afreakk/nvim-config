# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration repository (dotfiles for `~/.config/nvim`). It's a highly customized, modular Lua-based Neovim setup designed for professional development with support for 30+ programming languages via LSP integration, advanced text navigation, fuzzy finding, git integration, and debugging capabilities.

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
├── utils/              - Helper functions (other.lua, fzf.lua)
└── coc-settings.json   - LSP and language server configuration
```

### Plugin Organization

Plugins are organized into logical categories in `lua/afreak/plugins/`:

- **ui.lua** - Visual/UI elements (tabby, lualine, noice, snacks)
- **coc.lua** - Language servers and code intelligence (primary LSP via Coc.nvim)
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
- **restOfPlugins.lua** - Miscellaneous utilities
- **filetypePlugins.lua** - File type-specific configurations

### Key Binding Architecture

Keybindings are organized by mode and prefix in `lua/afreak/mappings/`:

**leader.lua** (~260+ lines):
- `spaceMaps` - Nested menus under `<leader><space>`
- `leaderMaps` - Direct `<leader>` bindings
- `localLeaderMaps` - Local leader (`\\`) bindings
- `x_leaderMaps` - Visual mode leader bindings

**other.lua** (~310+ lines):
- `n_mappings` - Normal mode (window navigation, diagnostics)
- `x_mappings` - Visual mode
- `i_mappings` - Insert mode (completion, scrolling)
- `c_mappings` - Command mode

### LSP and Language Support

**Primary LSP Provider**: Coc.nvim with 25+ language extensions configured in `coc-settings.json`

Supported languages include: C#, F#, Go, Haskell, Elm, Nix, Terraform, GraphQL, Python, JavaScript/TypeScript, Rust, and more.

**Language Server Configuration** (`coc-settings.json`):
- Configures all language servers and their options
- Defines diagnostic signs and virtual text appearance
- Sets up formatters (Prettier, buildifier, nixpkgs-fmt)
- Configures spell checking (en-US, Norwegian)
- Controls code completion priority and behavior

## Common Development Tasks

### Managing Plugins

All plugin management is done through Lazy.nvim (accessed via `<leader><space>l`):

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
:CocRestart         " Restart Coc and all language servers
:CocDiagnostics     " Show all diagnostics
```

### Making Configuration Changes

1. **Adding a new plugin**: Create a new `{plugin-name}.lua` file in `lua/afreak/plugins/` or add to `restOfPlugins.lua`
2. **Adding keybindings**: Add to appropriate file in `lua/afreak/mappings/`
3. **Adjusting editor options**: Modify `lua/afreak/options.lua`
4. **Configuring LSP for a language**: Update `coc-settings.json`

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

`lazy-lock.json` locks all 67+ plugins to specific versions. This ensures reproducible builds across systems. To update plugin versions, use `:Lazy update` and commit the updated `lazy-lock.json`.

## Common File Locations

| What | Where |
|------|-------|
| Plugin configs | `lua/afreak/plugins/*.lua` |
| Keybindings | `lua/afreak/mappings/*.lua` |
| Editor options | `lua/afreak/options.lua` |
| Language servers | `coc-settings.json` |
| Spellcheck files | `spell/` |
| Snippets | `vscodesnippets/` |
| Compiler configs | `compiler/` |

## Notes for Contributors

- **Lua style**: Uses Lua with Neovim API (`vim.*` namespace)
- **Formatting**: Plugins configured in `opts` tables; no external formatter currently set up
- **Dependencies**: All dependencies are managed via Lazy.nvim in `lazy-lock.json`
- **Testing**: No automated tests; changes are tested interactively in Neovim
- **Modular approach**: Keep related functionality in single files; split only when a file exceeds ~100 lines
