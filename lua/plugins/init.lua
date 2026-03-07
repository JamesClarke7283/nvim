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
  -- MCP Hub for MCP server integration (used by Avante)
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "bundled_build.lua",
    config = function()
      require("mcphub").setup({
        use_bundled_binary = true,
        extensions = {
          avante = {
            make_slash_commands = true,
          },
        },
      })
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    config = function()
      require("avante").setup({
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
        -- MCP Hub integration: inject active MCP server context into every prompt
        system_prompt = function()
          local hub = require("mcphub").get_hub_instance()
          return hub and hub:get_active_servers_prompt() or ""
        end,
        -- MCP Hub integration: add use_mcp_tool and access_mcp_resource tools
        custom_tools = function()
          return {
            require("mcphub.extensions.avante").mcp_tool(),
          }
        end,
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      "ravitemer/mcphub.nvim",
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
 },
  -- ThePrimeagen's 99 AI agent
  {
    "ThePrimeagen/99",
    lazy = false,
    config = function()
      local _99 = require("99")
      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)
      _99.setup({
        logger = {
          level = _99.DEBUG,
          path = "/tmp/" .. basename .. ".99.debug",
          print_on_error = true,
        },
        md_files = {
          "AGENT.md",
        },
      })
    end,
  },
}
