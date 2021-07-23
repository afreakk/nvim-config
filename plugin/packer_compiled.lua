-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/afreak/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/afreak/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/afreak/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/afreak/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/afreak/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Comrade = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/Comrade"
  },
  ["Recover.vim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/Recover.vim"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["fuzzymenu.vim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/fuzzymenu.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n—\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rsections\14lualine_a\1\0\0\1\3\0\0\15coc#status\tmode\foptions\1\0\0\1\0\1\ntheme\fgruvbox\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["nredir.nvim"] = {
    commands = { "Nredir" },
    loaded = false,
    needs_bufread = false,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/opt/nredir.nvim"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["starlark.vim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/starlark.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["todo.txt-vim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/todo.txt-vim"
  },
  ["vim-choosewin"] = {
    config = { "\27LJ\2\nL\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\31ARSTDHNEIOQWFPGJLUYZXCVBKM\20choosewin_label\6g\bvim\0" },
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-choosewin"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-nix"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-nix"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-subversive"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-subversive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/vim-visual-star-search"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/afreak/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-choosewin
time([[Config for vim-choosewin]], true)
try_loadstring("\27LJ\2\nL\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\31ARSTDHNEIOQWFPGJLUYZXCVBKM\20choosewin_label\6g\bvim\0", "config", "vim-choosewin")
time([[Config for vim-choosewin]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n—\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\rsections\14lualine_a\1\0\0\1\3\0\0\15coc#status\tmode\foptions\1\0\0\1\0\1\ntheme\fgruvbox\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
if vim.fn.exists(":TSPlaygroundToggle") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Nredir") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Nredir lua require("packer.load")({'nredir.nvim'}, { cmd = "Nredir", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
