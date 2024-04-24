local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    rust = { "rustfmt" },
    typescript = {"prettier"},
    javascript = {"prettier"},
    typescriptreact = {"prettier"},
    javascriptreact = {"prettier"}
  },

   format_on_save = {
     timeout_ms = 2000,
     enabled = true,
   },
}

require("conform").setup(options)
