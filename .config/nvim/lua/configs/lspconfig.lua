-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "clangd", "yamlls", "jsonls", "phpactor", "eslint", "html", "cssls", "erlangls", "ruby_lsp", "jdtls"}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        -- virtual_text = true,
        virtual_text = {
          spacing = 2,
        },
        underline = true,
        --signs = true,
        signs = function(namespace, bufnr)
          return vim.b[bufnr].show_signs == true
        end,
        update_in_insert = false,
    }
)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    --virtual_text = {
    --  spacing = 2,
    --  severity_limit = "Warning",
    --},
    severity_sort = true,
    underline = true,
    virtual_text = false, -- Disable builtin virtual text diagnostic
    --signs = function(namespace, bufnr)
    --  return vim.b[bufnr].show_signs == true
    --end,
    update_in_insert = true,
  }
)

lspconfig.pylsp.setup {
  --ignore = "E226,E302,E41,E501"
  settings = {
    pylsp = {
      plugins = {
        flake8 = {
          enabled = true,
          --ignore = {'E501', 'W501'},
          maxLineLength = 115
        },
        pycodestyle = { enabled = false },
      }
    }
  },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.elixirls.setup {
  --cmd = { "/home/retzs64/.local/share/nvim/mason/bin/elixir-ls" },
  elixirLS = {
    fetchDeps = false,
    dialyzerEnabled = true,
    projectDir = tostring(vim.loop.cwd()),
  },
  cmd = { "/home/retzs64/.config/nvim/lua/custom/docker-elixir-lspserver.sh", tostring(vim.loop.cwd()) },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
