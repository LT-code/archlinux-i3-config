local overrides = require("custom.overrides")

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

  --
  -- CUSTOM NVCHAD
  --
  --{
  --  "jose-elias-alvarez/null-ls.nvim",
  --  config = function()
  --    require "plugins.null-ls"
  --  end,
  --},
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },


  --
  -- ULTRA CUSTOM
  --
  {
    'nvim-java/nvim-java',
    config = function()
      require('java').setup()
    end,
    --opts = {
		--	registries = {
		--	  'github:nvim-java/mason-registry',
		--	  'github:mason-org/mason-registry'
		--	},
		--}
    ft = { "java" }
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  --{"mfussenegger/nvim-dap"},
  --{"psliwka/vim-smoothie", lazy = false},
  {"editorconfig/editorconfig-vim", lazy = true}, -- file that configure tab and spaces count

  -- Search && replace
  -- {"nvim-lua/plenary.nvim"} = {},
  {"windwp/nvim-spectre", lazy = true},

  -- git
  {'sindrets/diffview.nvim', lazy = true},
  {"AndrewRadev/linediff.vim", lazy = true},

  {"lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append "space:⋅"
      vim.opt.listchars:append "space:⋅"
    end,
  },
  {"iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown", "mermaid" }
    end,
    ft = { "markdown", "mermaid" }
  },
  {'mzlogin/vim-markdown-toc',
    ft = { "markdown", "mermaid" }
  },
}
