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

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "css-lsp",
    "html-lsp",
    "elixir-ls",
    "emmet-ls",
    "ruby-lsp",
    "json-lsp",
    "yaml-language-server",
    "yamlfmt",
    "prettier",
    "eslint-lsp",
    "shfmt",
    "shellcheck",
    "phpactor"
    --"jdtls@1.38.0"
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

return M
