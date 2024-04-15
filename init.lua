vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- Load plugins using Lazy
require("lazy").setup({
  -- Import NvChad plugin with specific branch
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require("options") -- Load options configuration
    end,
  },
  -- Import other plugins
  { import = "plugins" },
}, lazy_config) -- Assume 'lazy_config' is defined elsewhere in the code

-- Load theme components
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Import NvChad autocmds (automatic commands)
require("nvchad.autocmds")

-- Schedule mappings (keyboard shortcuts) to be applied after initializing Lazy
vim.schedule(function()
  require("mappings") -- Load mappings configuration
end)

-- Functionality to open the Projects directory on start-up can be added hereim.cmd "cd ~/Projects"
