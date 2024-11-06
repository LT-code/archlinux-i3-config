-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig

local overrides = require("custom.overrides")

local M = {}

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.mason = {
  pkgs = {
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
    "phpactor",
    "cmake-language-server",
    "clangd"
  }
}

M.ui = {
  --theme = "tokyodark",
  hl_override = overrides.highlights.override,
  hl_add = overrides.highlights.add,
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal

    -- default/round/block/arrow (separators work only for "default" statusline theme;
    -- round and block will work for the minimal theme only)
    separator_style = "default",
    overriden_modules = nil,
  },
  -- statusline = {
  --   -- modules arg here is the default table of modules
  --   overriden_modules = function(modules)
  --     modules[1] = (function()
  --       return "MODE!"
  --     end)()

  --     -- define the somefunction anywhwere in your custom dir, just call it well!
  --     -- modules[2] = somefunction()  

  --     -- adding a module between 2 modules
  --     -- Use the table.insert functin to insert at specific index
  --     -- This will insert a new module at index 2 and previous index 2 will become 3 now

  --     table.insert(
  --       modules,
  --       2,
  --       (function()
  --         return " between mode and filename ! "
  --       end)()
  --     )
  --   end,
  -- },
}

return M
