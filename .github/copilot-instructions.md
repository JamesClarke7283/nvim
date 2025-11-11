## Quick orientation for AI coding agents

This repo is a personal Neovim configuration based on NvChad (v2.5). The goal of this doc is to help an AI agent be immediately productive when editing, adding, or diagnosing configuration here.

- Project layout (important files)
  - `init.lua` — top-level bootstrap: sets leader, bootstraps `lazy.nvim`, loads `configs.lazy`, imports NvChad core and `plugins`.
  - `lua/chadrc.lua` — user-level NVChad configuration (theme, UI overrides).
  - `lua/options.lua` — where Neovim options are initialized (wrapper around `nvchad.options`).
  - `lua/mappings.lua` — key mappings. LLM/Chat mappings are defined here (leader + lm* mappings call ChatGPT/LLM commands).
  - `lua/configs/lazy.lua` — `lazy.nvim` config (defaults, disabled rtp plugins, icons). This file controls global lazy behavior.
  - `lua/plugins/init.lua` — plugin spec list consumed by `lazy.nvim`. Add or modify plugin entries here.
  - `lua/configs/*` — per-plugin configuration modules (conform, lspconfig, etc.) — referenced from `plugins/init.lua` via `config = function() require("configs.<name>") end`.

- Big-picture architecture/flow
  - `init.lua` bootstraps `lazy.nvim` into `runtimepath` and then calls `require('lazy').setup({ ... }, lazy_config)`.
  - Plugins are declared in `lua/plugins/init.lua`. Each plugin may either be eagerly loaded (`lazy = false`) or lazy-loaded (default controlled by `configs.lazy` defaults).
  - Per-plugin configuration lives under `lua/configs/` and is invoked from the plugin spec `config` function.
  - UI/theme is handled by NvChad and the `base46` cache (path stored in `vim.g.base46_cache`) — theme pieces are loaded with `dofile(vim.g.base46_cache .. "defaults")` in `init.lua`.

- Conventions and patterns (what to follow)
  - To add a plugin: modify `lua/plugins/init.lua` — add a table entry. Prefer adding `config = function() require("configs.<name>") end` that points to `lua/configs/<name>.lua` for config.
  - Keep `lazy = true` (default) unless the plugin must load eagerly. The repo-level default `defaults = { lazy = true }` is in `lua/configs/lazy.lua`.
  - Mason-managed LSP/tools: `plugins/init.lua` sets `mason.nvim` with `ensure_installed`. If adding language tooling, add the package to that list or manage in `lua/configs/mason.lua` if you create one.
  - Mapping placement: add keymaps to `lua/mappings.lua` (it already requires `nvchad.mappings` and then extends).

- Notable project-specific behaviors
  - The config clones `lazy.nvim` automatically if missing (see `init.lua` bootstrap). Don't duplicate that elsewhere.
  - Workspace is forced to `~/Projects` on startup in `init.lua` (`vim.cmd [[cd ~/Projects]]`). Be aware of relative paths when editing startup behavior.
  - `lua/plugins/init.lua` contains a number of plugins with `build` steps (e.g., `codesnap` has `build = "make build"`). Respect `build` when changing plugin specs.
  - Avante AI integration: `plugins/init.lua` includes `yetone/avante.nvim` with an `ollama` endpoint configured — changes to LLM provider settings are in the plugin opts.
  - Copilot/provider usage: `zbirenbaum/copilot.lua` is included as an optional dependency for Avante and other providers.

- Useful commands and developer workflows
  - Bootstrap/first run: clone repo to `~/.config/nvim` then open Neovim — `init.lua` bootstraps `lazy.nvim` automatically.
  - Manage plugins inside Neovim using `:Lazy` commands (comes with `lazy.nvim`). Use `:Lazy install`, `:Lazy update`, `:Lazy build` for plugins that need building.
  - Mason install: run `:Mason` and ensure binaries listed in `plugins/init.lua` `ensure_installed` are present.
  - Troubleshooting: use `:checkhealth`, `:messages`, and `:Lazy log` (or check `~/.local/share/nvim/lazy/` for plugin state) to debug plugin failures.

- Editing tips and examples
  - Add plugin example (append to `lua/plugins/init.lua`):

    {
      "author/new-plugin",
      lazy = false, -- or omit to keep lazy
      config = function()
        require("configs.new_plugin")
      end,
    },

  - Create `lua/configs/new_plugin.lua` with small `require("new_plugin").setup({...})` style configuration.
  - Change keybinding example: edit `lua/mappings.lua` — mappings use `vim.keymap.set` with a `desc` for discoverability.

- Files to check when diagnosing issues
  - `init.lua` — startup bootstrap and theme loads
  - `lua/configs/lazy.lua` — lazy defaults and disabled runtime plugins
  - `lua/plugins/init.lua` — plugin specs and build steps
  - `lua/mappings.lua` and `lua/options.lua` — mapping or option regressions

If anything above is unclear or you'd like me to expand any section (for example, an example plugin config or a short checklist for adding a new LSP), tell me which part and I'll iterate.
