return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "jwalton512/vim-blade",
    ft = "blade"
  },

  {
    "rafamadriz/friendly-snippets",
    config = function ()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  {
    "laytan/tailwind-sorter.nvim",
    build = "cd formatter && npm i",
    depedencies = {"nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim"},
    config = true,
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      }
    }
  },

  {
    "brianhuster/autosave.nvim",
    event = {"InsertEnter", "TextChanged"},
    config = function ()
      require("autosave").setup({
        enable = true,
        execution_message = function ()
          return "Auto saved at " .. os.date("%H:%M:%S")
        end,
        debounce_delay = 135,
        conditions = {
          exists = true,
          modifiable = true,
          filename_is_not = {},
          filetype_is_not = {},
        },
      })
    end,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = {"BufReadPre", "BufWritePre"},
    config = function ()
      require "configs.chunk"
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl",
    ---@type ibl.config
    opts = {},
    enable = false,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function ()
      require "configs.inline-diagnostics"
    end,
  },

  {
    "IogaMaster/neocord",
    event = "VeryLazy",
    config = function ()
      require "configs.discord"
    end,
  },
  {"nvchad/volt", lazy = true},
  {
    "nvchad/minty",
    lazy = true,
    config = function ()
      require "configs.minty"
    end,
  },

  {"nvchad/menu", lazy = true},
  {"nvchad/showkeys", cmd = "ShowKeysToggle", opts = {position = "top-center"}},
  {"nvchad/timerly", cmd = "TimerlyToggle"},

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "typescript-language-server",
        "python-lsp-server",
        "php-cs-fixer",
        "blade-formatter",
        "prettier",
        "black",
        "gopls",
        "stylua",
      }
    }
  },

}
