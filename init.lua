vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- Suppress deprecated vim.lsp.buf_get_clients() warning from plugins
vim.lsp.buf_get_clients = function(bufnr)
  return vim.lsp.get_clients({ buffer = bufnr or 0 })
end

-- Add avante native libraries to cpath
local avante_lib_path = vim.fn.stdpath("data") .. "/lazy/avante.nvim/build/?.so"
if not string.find(package.cpath, avante_lib_path, 1, true) then
  package.cpath = package.cpath .. ";" .. avante_lib_path
end

-- Load environment variables from .env file
local env_file = vim.fn.stdpath("config") .. "/.env"
if vim.fn.filereadable(env_file) == 1 then
  for _, line in ipairs(vim.fn.readfile(env_file)) do
    local key, value = line:match("^([%w_]+)=(.+)$")
    if key and value then
      vim.fn.setenv(key, value)
    end
  end
end

-- Enable Avente AI
--require('configs.avante')

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

-- Functionality to open the Projects directory on start-up can be added here, and open NvimTreeToggle. 
vim.cmd [[cd ~/Projects]]


-- Configure Nvim tree to include .gitignore files but grayed out
require("nvim-tree").setup({
  filters = {
    custom = {},
    exclude = {},
  },
  renderer = {
    highlight_git = true, -- Enable highlighting for git status
    highlight_opened_files = "all", -- Optional: Highlight files that are opened
  },
  git = {
    enable = true, -- Ensure git integration is enabled
    ignore = false, -- Do not ignore git ignored files
  },
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
})
-- Open Nvim Tree on startup
-- vim.cmd [[NvimTreeToggle]]

-- Termux LSP
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "build.sh", "*.subpackage.sh", "PKGBUILD", "*.install",
    "makepkg.conf", "*.ebuild", "*.eclass", "color.map", "make.conf" },
  callback = function()
    vim.lsp.start({
      name = "termux",
      cmd = { "termux-language-server" }
    })
  end,
})
