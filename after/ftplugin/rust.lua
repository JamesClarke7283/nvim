-- Rust-specific keymaps (loaded only in Rust buffers)
-- These leverage rustaceanvim's RustLsp commands for rust-analyzer features

local bufnr = vim.api.nvim_get_current_buf()
local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
end

-- Code actions (supports rust-analyzer's grouped code actions)
map("n", "<leader>ra", function() vim.cmd.RustLsp('codeAction') end, "Rust: Code Action")

-- Hover actions (press twice to enter the hover window)
map("n", "K", function() vim.cmd.RustLsp({ 'hover', 'actions' }) end, "Rust: Hover Actions")

-- Runnables / Debuggables
map("n", "<leader>rr", function() vim.cmd.RustLsp('runnables') end, "Rust: Runnables")
map("n", "<leader>rl", function() vim.cmd.RustLsp({ 'runnables', bang = true }) end, "Rust: Rerun Last")
map("n", "<leader>rt", function() vim.cmd.RustLsp('testables') end, "Rust: Testables")
map("n", "<leader>rd", function() vim.cmd.RustLsp('debuggables') end, "Rust: Debuggables")

-- Diagnostics
map("n", "<leader>re", function() vim.cmd.RustLsp('explainError') end, "Rust: Explain Error")
map("n", "<leader>rD", function() vim.cmd.RustLsp('renderDiagnostic') end, "Rust: Render Diagnostic")
map("n", "<leader>rR", function() vim.cmd.RustLsp('relatedDiagnostics') end, "Rust: Related Diagnostics")

-- Expand macro recursively
map("n", "<leader>rm", function() vim.cmd.RustLsp('expandMacro') end, "Rust: Expand Macro")

-- Rebuild proc macros
map("n", "<leader>rp", function() vim.cmd.RustLsp('rebuildProcMacros') end, "Rust: Rebuild Proc Macros")

-- Open Cargo.toml
map("n", "<leader>rc", function() vim.cmd.RustLsp('openCargo') end, "Rust: Open Cargo.toml")

-- Open docs.rs for symbol under cursor
map("n", "<leader>ro", function() vim.cmd.RustLsp('openDocs') end, "Rust: Open docs.rs")

-- Parent module
map("n", "<leader>ru", function() vim.cmd.RustLsp('parentModule') end, "Rust: Parent Module")

-- Join lines (works in visual mode too)
map("n", "<leader>rj", function() vim.cmd.RustLsp('joinLines') end, "Rust: Join Lines")
map("v", "<leader>rj", function() vim.cmd.RustLsp('joinLines') end, "Rust: Join Lines")

-- Move item up/down
map("n", "<leader>rk", function() vim.cmd.RustLsp({ 'moveItem', 'up' }) end, "Rust: Move Item Up")
map("n", "<leader>rJ", function() vim.cmd.RustLsp({ 'moveItem', 'down' }) end, "Rust: Move Item Down")

-- Structural search replace
map("n", "<leader>rs", function() vim.cmd.RustLsp('ssr') end, "Rust: Structural Search Replace")
map("v", "<leader>rs", function() vim.cmd.RustLsp('ssr') end, "Rust: Structural Search Replace")

-- View HIR / MIR
map("n", "<leader>rh", function() vim.cmd.RustLsp({ 'view', 'hir' }) end, "Rust: View HIR")
map("n", "<leader>ri", function() vim.cmd.RustLsp({ 'view', 'mir' }) end, "Rust: View MIR")

-- Syntax tree
map("n", "<leader>ry", function() vim.cmd.RustLsp('syntaxTree') end, "Rust: Syntax Tree")

-- Fly check (manual cargo check/clippy trigger)
map("n", "<leader>rf", function() vim.cmd.RustLsp({ 'flyCheck', 'run' }) end, "Rust: Fly Check")

-- Crate graph
map("n", "<leader>rg", function() vim.cmd.RustLsp({ 'crateGraph' }) end, "Rust: Crate Graph")
