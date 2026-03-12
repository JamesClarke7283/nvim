-- LSP servers with default config
-- NOTE: rust_analyzer is managed by rustaceanvim — do NOT add it here
local servers = {
  "html",
  "cssls",
  "pyright",
  "tailwindcss",
  "asm_lsp",
  "bashls",
  "dockerls",
  "docker_compose_language_service",
  "htmx",
  "java_language_server",
  "jqls",
  "jsonls",
  "jinja_lsp",
  "yamlls",
  "zls",
}

vim.lsp.enable(servers)

-- Fix the issue of denols always being loaded for non-deno projects
vim.lsp.config("denols", {
  root_markers = { "deno.json", "deno.jsonc" },
})

vim.lsp.config("ts_ls", {
  root_markers = { "package.json" },
  workspace_required = true,
})

vim.lsp.enable("denols")
vim.lsp.enable("ts_ls")
