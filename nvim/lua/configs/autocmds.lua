-- ~/.config/nvim/lua/configs/autocmds.lua
-- AUTO COMMAND CUSTOM
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Hapus karakter tab, ganti dengan spasi
    vim.cmd "silent! retab"

    -- Format otomatis kalau ada LSP aktif
    if vim.lsp.buf.format then
      vim.lsp.buf.format { async = false }
    end
  end,
})
