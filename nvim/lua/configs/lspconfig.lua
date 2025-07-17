local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- Daftar server atau LSP 
local servers = {"html", "cssls", "intelephense", "lua_ls", "ts_ls", "pylsp", "gopls", "svelte". "dartls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

require('lspconfig').intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"php"},
  settings = {
    intelephense = {
      environment = {
        includePaths = {
          "vendor/phpunit/phpunit/",
          "vendor/laravel/framework/src/",
        }
      }
    }
  }
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"html", "blade"},
  init_options = {
    userLanguages = {
      blade = "html",
    }
  }
}
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"go"}
}
lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"svelte"}
}
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"js", "ts", "tsx", "jsx", "blade"}
}
lspconfig.pylsp.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.html.setup {}
lspconfig.cssls.setup {}
lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "blade" },
}

lspconfig.dartls.setup {
  cmd = {"dart", "language-server", "--protocol=lsp"},
  filetypes = {"dart"},
  root_dir = lspconfig.util.root_pattern("pubspec.yaml")
}
