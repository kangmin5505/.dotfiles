-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
-- local servers = {
--   html = {},
--   cssls = {},
--   clangd = {},
--   lua_ls = {
--     settings = {
--       Lua = {
--         diagnostics = {
--           globals = { "vim" }
--         }
--       }
--     }
--   },
-- }
--
local servers = {
  "html",
  "cssls",
  "clangd",
  "pyright",
  "jdtls",
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        }
      }
    }
  },
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        procMacro = { enable = true },
      }
    }
  }
}

local nvlsp = require "nvchad.configs.lspconfig"

-- Iterate over servers
for lsp, config in pairs(servers) do
  -- Check if it's a string (default config) or a table (custom settings)
  if type(config) == "string" then
    lspconfig[config].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  else
    lspconfig[lsp].setup(vim.tbl_deep_extend("force", {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }, config))
  end
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
