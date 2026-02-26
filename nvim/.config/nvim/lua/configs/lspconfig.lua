-- Keep NVChad defaults (capabilities, on_attach, etc.)
require("nvchad.configs.lspconfig").defaults()

-- Pull NVChad's helpers
local nvlsp = require "nvchad.configs.lspconfig"

-- Detect API:
--   - On Neovim ≥ 0.11, vim.lsp.config exists (new API) and we use vim.lsp.enable
--   - On Neovim 0.10.x, fall back to require("lspconfig").<server>.setup
local new_api = vim.lsp.config ~= nil
local lspconfig = new_api and nil or require("lspconfig")

-- Your servers table (strings = default config, tables = custom)
local servers = {
  "html",
  "cssls",
  "clangd",
  "pyright",
  "jdtls",  -- note: jdtls is commonly managed via nvim-jdtls; see note below
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } }
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

-- Helper to merge your per-server config with NVChad defaults
local function with_defaults(cfg)
  return vim.tbl_deep_extend("force", {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }, cfg or {})
end

-- Iterate over servers
for key, val in pairs(servers) do
  local name, cfg
  if type(val) == "string" then
    name, cfg = val, with_defaults({})
  else
    name, cfg = key, with_defaults(val)
  end

  if new_api then
    -- Neovim ≥ 0.11
    -- Provide the config data to the core, then enable
    vim.lsp.config[name] = cfg
    vim.lsp.enable(name)
  else
    -- Neovim 0.10.x fallback
    lspconfig[name].setup(cfg)
  end
end

-- Example of configuring one server explicitly (TypeScript) in the new API:
-- if new_api then
--   vim.lsp.config.ts_ls = with_defaults({
--     -- settings / init_options / on_attach overrides here
--   })
--   vim.lsp.enable("ts_ls")
-- else
--   lspconfig.ts_ls.setup(with_defaults({}))
-- end
