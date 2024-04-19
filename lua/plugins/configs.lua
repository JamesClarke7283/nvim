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
})

