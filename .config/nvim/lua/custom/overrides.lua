local M =  {}

M.treesitter = {
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  ensure_installed = {
    "lua",
    "php",
    "html",
    "css",
    "bash",
    "eex",
    "elixir",
    "erlang",
    "javascript",
    "json",
    "ruby",
    "markdown",
    "vim",
    "yaml",
    "ruby",
    "java"
  }
}

M.nvimtree = {
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
  },
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.highlights = {
  add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
  override = {
    Comment = {
      italic = true,
    },
  }
}


return M

