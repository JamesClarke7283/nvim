return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require("configs.conform")
    end,
  },

  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
      require("trouble").setup({
        height = 30,
      })

      vim.keymap.set("n", "<leader>x", function()
        vim.cmd("TroubleToggle")
      end, { silent = true, noremap = true, desc = "Toggle Diagnostics Panel" })
    end
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp" , "prettier", "rust-analyzer", "pyright", "deno","tailwindcss-language-server"
      },
    }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css"
      },
    },
  },
  -- Ollama Copilot
  {
    "David-Kunz/gen.nvim",
    lazy = false,
    opts = {
      model = "starling-lm:7b-beta-q6_K", -- The default model to use.
      host = "ollama.jamesdavidclarke.com", -- The host running the Ollama service.
      port = 443,
      debug = false,
      command = function(options)
        local body = {model = options.model, stream = true}
        return "curl --silent --no-buffer -X POST https://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
      end,
    },
  },
}
