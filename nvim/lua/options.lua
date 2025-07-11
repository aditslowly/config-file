require "nvchad.options"

local o = vim.o
o.cursorlineopt = 'both'

local lsp_vim = vim.lsp
lsp_vim.set_log_level("off")
