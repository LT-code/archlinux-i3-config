require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

------ Display diagnostics as virtual text only if not in insert mode
----autocmd("InsertEnter", {
----  pattern = "*",
----  callback = function()
----    vim.diagnostic.config({
----      virtual_text = false,
----    })
----  end
----})
----autocmd("InsertLeave", {
----  pattern = "*",
----  callback = function()
----    vim.diagnostic.config({
----      virtual_text = false,
----    })
----  end
----})


vim.cmd "set shell=/bin/zsh"
--vim.cmd "set spelllang=fr_fr spell"
--vim.cmd ":setlocal spell spelllang=fr"
vim.cmd "set relativenumber"
vim.cmd([[command! MarkdownGenSummary GenTocGFM ]])

local g = vim.g
local o = vim.opt

o.title = false
o.titlestring = "NVIM : %{system(\"basename $(git rev-parse --show-toplevel) | tr '[:lower:]' '[:upper:]'\")}"

vim.diagnostic.config({ virtual_text = false })

g.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell/"
--g.mapleader = ","
--o.relativenumber = true
--o.tabstop = 4
--
--o.wildmode = "longest,list,full"
--o.backspace = "indent,eol,start"
--o.hlsearch = false
--o.incsearch = true
--
--g.session_directory = tostring(os.getenv("HOME")) .. "/.config/nvim/session"
--g.session_autoload = "no"
--g.session_autosave = "no"
--
--o.backup = false
--o.swapfile = false
--o.compatible = false
--o.so = 7
--o.undodir = tostring(os.getenv("HOME")) .. "/.cache/nvim/undodir"
--o.undofile = true
--o.foldmethod = "indent"
--o.foldlevelstart = 20


----------------------------------------------------------------------
-- show diagntic virtual text on current line
----------------------------------------------------------------------
local ns = vim.api.nvim_create_namespace('CurlineDiag')
vim.opt.updatetime = 100
vim.api.nvim_create_autocmd('LspAttach',{
  callback = function(args)
    vim.api.nvim_create_autocmd('CursorHold', {
      buffer = args.buf,
      callback = function()
        pcall(vim.api.nvim_buf_clear_namespace,args.buf,ns, 0, -1)
        local hi = { 'Error', 'Warn','Info','Hint'}
        local curline = vim.api.nvim_win_get_cursor(0)[1]
        local diagnostics = vim.diagnostic.get(args.buf, {lnum =curline - 1})
        local virt_texts = { { (' '):rep(4) } }
        for _, diag in ipairs(diagnostics) do
          virt_texts[#virt_texts + 1] = {diag.message, 'Diagnostic'..hi[diag.severity]}
        end
        vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0,{
          virt_text = virt_texts,
          hl_mode = 'combine'
        })
      end
    })
  end
})

