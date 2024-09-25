local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  diagnostics.shellcheck.with {
    diagnostics_format = "#{m} [#{c}]",
    diagnostic_config = {
        -- see :help vim.diagnostic.config()
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
    },
  },

  -- webdev stuff
  formatting.deno_fmt,
  formatting.prettier,
  formatting.stylua,

  -- yaml / json
  null_ls.builtins.diagnostics.cfn_lint,

  --python
  --null_ls.builtins.formatting.pyflyby,

  -- Shell
  formatting.shfmt,

  ---- elixir
  formatting.mix.with { command = "/home/retzs64/.config/nvim/lua/custom/docker-elixir-mix-cmd.sh", args = { (vim.loop.cwd()), "$FILENAME" }},
  --b.formatting.surface.with { cmd = "/home/retzs64/toto2.sh"},
}

null_ls.setup {
   debug = false,
   sources = sources,
}
