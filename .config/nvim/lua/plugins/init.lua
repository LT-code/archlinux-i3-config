local overrides = require("custom.configs.overrides")

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

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "custom.configs.null-ls"
    end,
  },
  -- Override plugin definition options

  --{
  --  "neovim/nvim-lspconfig",
  --  dependencies = {
  --    -- format & linting
  --    {
  --      "jose-elias-alvarez/null-ls.nvim",
  --      config = function()
  --        require "custom.configs.null-ls"
  --      end,
  --    },
  --  },
  --  config = function()
  --    require "plugins.configs.lspconfig"
  --    require "custom.configs.lspconfig"
  --  end, -- Override to setup mason-lspconfig
  --},
  --{
  --  "NvChad/nvterm",
  --  opts = {
  --    terminals = {
  --      type_opts = {
  --        vertical = { location = "rightbelow", split_ratio = 0.3 },
  --        float = {
  --          relative = 'editor',
  --          row = 0.15,
  --          col = 0.15,
  --          width = 0.7,
  --          height = 0.6,
  --          border = "single",
  --        },
  --        horizontal = { location = "rightbelow", split_ratio = .6, },
  --      },
  --    },
  --  },
  --},
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
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
  --["folke/todo-comments.nvim"] = {
  --  requires = "nvim-lua/plenary.nvim",
  --  config = function()
  --    require("todo-comments").setup({})
  --  end
  --},
  --["tpope/vim-fugitive"] = {
  --  cmd = {
  --    "Git",
  --    "Gdiff",
  --    "Gdiffsplit",
  --    "Gvdiffsplit",
  --    "Gwrite",
  --    "Gw",
  --  }
  --},
  --['phaazon/hop.nvim'] = { -- display letter to go to them
  --  branch = 'v2', -- optional but strongly recommended
  --  config = function()
  --    local hop = require('hop')
  --    hop.setup()
  --    vim.keymap.set('', 'f', function()
  --      hop.hint_char1()
  --    end, {remap=true})
  --  end
  --},
  --["preservim/nerdcommenter"] = {}, -- comment one line or more (<leader>cc or <leader>cu)
  ----
  --["Weissle/persistent-breakpoints.nvim"] = {
  --  config = function()
  --    require('persistent-breakpoints').setup({
  --    	save_dir = vim.fn.stdpath('data') .. '/nvim_checkpoints',
  --    	-- when to load the breakpoints? "BufReadPost" is recommanded.
  --    	load_breakpoints_event = nil,
  --    	-- record the performance of different function. run :lua require('persistent-breakpoints.api').print_perf_data() to see the result.
  --    	perf_record = false,
  --    })
  --  end,
  --  requires = { 'mfussenegger/nvim-dap' }
  --},
}
