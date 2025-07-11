-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false;
})

M.base46 = {
	theme = "bearded-arc",
  integrations = {"dap"},
  transparency = true,
}

M.ui = {
  statusline = {
    theme = "minimal",
    separator_style = "default"
  },
  ident = {
    enable = true,
  },
  hl_override = {
    NvimTreeNormal = {bg = '#141b1e'},
    NvimTreeNormalNC = {bg = '#141b1e'},
    NvimTreeWinSeparator = { bg = "#141b1e", fg = "#141b1e" },
    WinSeparator = { bg = "#141b1e" },
    NavicSeparator = { bg = "#ffffff" },
    BufferLineSeparator = { bg = "#141b1e" },
    WhichKeySeparator = { bg = "#141b1e" },
    BufferLineSeparatorVisible = { bg = "#141b1e" },
    BufferLineSeparatorSelected = { bg = "#141b1e" },
    LineNr = { bg = "#141b1e" },
    NvimTreeOpenedFolderName = { bg = "#141b1e" },
    DapUILineNumber = { bg = "#141b1e" },
    BufferLineBackground = { bg = "#141b1e" }
  },
  nvdash = {
    load_on_startup = true,
  },
  tabufline = {
    enable = false,
    show_numbers = true,
  },
  cmp = {
    style = "atom"
  }
}

return M
