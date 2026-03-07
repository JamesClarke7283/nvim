return {
  {
    "MunifTanjim/nui.nvim",
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },
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
        height = 40,
      })
    end
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
    lazy = false,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp" , "prettier", "rust-analyzer", "pyright", "deno","tailwindcss-language-server","asm-lsp","bash-language-server","docker-compose-language-service","dockerfile-language-server","htmx-lsp","java-language-server","jinja-lsp","jq-lsp","json-lsp","luacheck","yaml-language-server","zls","typescript-language-server"
      },
    },
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
  {
    'nvimdev/lspsaga.nvim',
    lazy=false,
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    }
  },
  {
    "sunaku/vim-dasht",
    lazy=false
  },
  {
  -- git plugin
    'tpope/vim-fugitive',
    lazy=false
  },
  {
  "mistricky/codesnap.nvim",
  build = "make build",
  lazy=false,
  opts = {
    save_path = "~/Pictures/Screenshots",
    has_breadcrumbs = true,
    bg_theme = "bamboo",
  }
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    opts = {
      provider = "ollama",
      input = {
        provider = "dressing",
      },
      providers = {
        ollama = {
          endpoint = "https://ollama.com",
          model = "kimi-k2.5:cloud",
          api_key_name = "OLLAMA_API_KEY",
        },
        copilot = {
          -- copilot provider is built-in, just needs copilot.lua dependency
        },
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  -- Project Manager
  {
  "coffebar/project.nvim",
  lazy=false,
  config = function()
    require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
      require('telescope').load_extension('projects')
  end,
    dependencies = {"nvim-telescope/telescope.nvim"}
 }
}
