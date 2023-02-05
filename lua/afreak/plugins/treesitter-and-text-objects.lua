return {
	-- not really treesitter, but should be grouped together with matchup ?
	{ 'michaeljsmith/vim-indent-object', event = "BufReadPost" },
	{ 'echasnovski/mini.ai', version = false, event = "BufReadPost", config = function()
		require('mini.ai').setup({
			custom_textobjects = {
				-- use treesitter-textobjects instead of Function call
				f = false,
				-- rebind  function_call to F instead of f
				F = require('mini.ai').gen_spec.function_call(),
				-- use treesitter-textobjects instead of Argument
				a = false,
				-- rebind  argument to A instead of a
				A = require('mini.ai').gen_spec.argument(),
			}
		})
	end },
	{ 'andymass/vim-matchup', event = "BufReadPost",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,

	},
	{
		"mfussenegger/nvim-treehopper",
		lazy = true,
		config = function()
			require("tsht").config.hint_keys = { "a", "r", "s", "t", "d", "h", "n", "e", "i", "o" }
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			'mrjones2014/nvim-ts-rainbow'
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				matchup = {
					enable = true, -- mandatory, false will disable the whole extension
				},
				ensure_installed = {
					"c", "graphql", "javascript", "haskell", --[[ "nix",  ]] "bash", "fish", "elm", "lua", "go", "gomod",
					"c_sharp", "html",
					"jq", "json", "jsonnet", "markdown", "markdown_inline", "php", "python", "regex", "toml",
					"typescript", "vim",
					"yaml", "cmake", "comment", "css", "cpp", "diff", "dockerfile", "sql", "help"
				},
				sync_install = false,
				-- auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				rainbow = {
					enable = true,
					extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						-- dont use <CR> for init, ruins cedit (commandline ctrl+f)
						init_selection = "<C-CR>",
						node_incremental = "<CR>",
						scope_incremental = "<S-CR>",
						node_decremental = "<BS>",
					},
				},

				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							['aa'] = '@parameter.outer',
							['ia'] = '@parameter.inner',
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]]"] = "@function.outer",
						},
						goto_next_end = {
							["]["] = "@function.outer",
						},
						goto_previous_start = {
							["[["] = "@function.outer",
						},
						goto_previous_end = {
							["[]"] = "@function.outer",
						},
					},
				},
			})
		end,
	},
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
}