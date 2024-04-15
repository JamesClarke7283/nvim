local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    rust = { "rustfmt" }
  },

   format_on_save = {
     timeout_ms = 2000,
     enabled = true,
   },
}

require("conform").setup(options)
