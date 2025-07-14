-- Highlight groups definition
local highlights = {
  Normal         = { fg = "#c0caf5", bg = "#101010" },
  Separator      = { fg = "#141b1e", bg = "#101010" },
  Separator2     = { fg = "#141b1e", bg = "#141b1e" },
  Separator3     = { fg = "#e0af68", bg = "#141b1e" },
  ModeText       = { fg = "#bb9af7", bg = "#141b1e" },
  PathText       = { fg = "#9ece6a", bg = "#141b1e" },
  FileText       = { fg = "#e0af68", bg = "#141b1e" },
  FileType       = { fg = "#f7768e", bg = "#141b1e" },
  BranchName     = { fg = "#7dcfff", bg = "#141b1e" },
  LineText       = { fg = "#bb9af7", bg = "#141b1e" },
  ColumnText     = { fg = "#7aa2f7", bg = "#141b1e" },
  PercentageText = { fg = "#9d7cd8", bg = "#141b1e" },
  TotalLineText  = { fg = "#73daca", bg = "#141b1e" },
}

-- Apply highlight groups
for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

-- Mode-specific recoloring
_G.RecolorMode = function()
  local mode = vim.fn.mode()
  local color_map = {
    n     = { fg = "#7aa2f7", bg = "#141b1e" }, -- normal
    i     = { fg = "#9ece6a", bg = "#141b1e" }, -- insert
    v     = { fg = "#f7768e", bg = "#141b1e" }, -- visual
    V     = { fg = "#f7768e", bg = "#141b1e" }, -- visual line
    [""] = { fg = "#f7768e", bg = "#141b1e" }, -- visual block
    c     = { fg = "#bb9af7", bg = "#141b1e" }, -- command
    R     = { fg = "#7dcfff", bg = "#141b1e" }, -- replace
    t     = { fg = "#e0af68", bg = "#141b1e" }, -- terminal
  }

  local hl = color_map[mode]
  if hl then
    vim.api.nvim_set_hl(0, "ModeText", hl)
  end
  return ""
end

-- Filetype display helper
_G.SetFiletype = function(filetype)
  return (filetype == nil or filetype == "") and "unknown" or filetype
end

-- Git branch detection
_G.GetBranchName = function()
  local dir = vim.fn.expand("%:p:h")
  if vim.fn.finddir(".git", dir .. ";") == "" then return "no-git" end

  local handle = io.popen("git -C " .. vim.fn.shellescape(dir) .. " branch --show-current 2>/dev/null")
  local result = handle and handle:read("*a") or ""
  if handle then handle:close() end

  return vim.trim(result) ~= "" and vim.trim(result) or "no-branch"
end

-- Column number formatting
_G.HandleColumnGap = function()
  local col = vim.fn.col(".")
  return col > 9 and "✖ " or "✖"
end

-- Statusline configuration
vim.opt.statusline = table.concat({
  "%{%v:lua.RecolorMode()%}",

  -- Left section
  "%#Separator#", -- Start rounded corner
  "%#ModeText#  ", -- Mode indicator
  "%#Separator#██", -- Transition separator
  "%#PathText#%{expand('%:p:h:t')}", -- Directory name
  "%#Separator#██", -- Transition separator
  "%#FileText#%t", -- Filename
  "%#Separator#█", -- End rounded corner

  "%=", -- Center alignment

  -- Right section
  -- Filetype block
  "%#Separator#", -- Start rounded corner
  "%#FileType#%{v:lua.SetFiletype(&filetype)}", -- Filetype
  "%#Separator# ", -- End rounded corner
  -- Line/Column block
  "%#Separator#", -- Start rounded corner
  "%#LineText#%2l", -- Line number
  "%#Separator#█", -- Vertical separator
  "%#Separator3#%{v:lua.HandleColumnGap()}", -- Column icon
  "%#ColumnText#%2c", -- Column number

  -- Percentage/Total lines block
  "%#Separator2#", -- Secondary separator background
  "%#Separator#██", -- Transition separator
  "%#PercentageText#%p%%", -- Percentage through file
  "%#Separator#█", -- Vertical separator
  "%#Separator3#", -- Total lines icon
  "%#Separator#█", -- Vertical separator
  "%#TotalLineText#%L", -- Total lines count
  "%#Separator#█", -- End rounded corner
})
