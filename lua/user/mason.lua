local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local status_ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok2 then
  return
end

mason_lspconfig.setup()

local lsp_on_attach = require("user.lsp.handlers").on_attach
local lsp_capabilities = require("user.lsp.handlers").capabilities

local opts = {
  on_attach = lsp_on_attach,
  capabilities = lsp_capabilities,
}

local dap_on_attach = require("user.dap.handlers").on_attach
local dap_dap = require("user.dap.handlers").dap

local status_ok3, rt = pcall(require, "rust-tools")
if not status_ok3 then
  return
end

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup(opts)
  end,
  ["sumneko_lua"] = function()
    local sumneko_lua_opts = require("user.lsp.settings.sumneko_lua");
    require("lspconfig").sumneko_lua.setup(
      vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
    )
  end,
  ["tsserver"] = function()
    local tsserver_opts = require("user.lsp.settings.tsserver")
    require("lspconfig").tsserver.setup(
      vim.tbl_deep_extend("force", tsserver_opts, opts)
    )
  end,
  ["html"] = function()
    local html_opts = require("user.lsp.settings.html")
    require("lspconfig").html.setup(
      vim.tbl_deep_extend("force", html_opts, opts)
    )
  end,
  ["pyright"] = function()
    local pyright_opts = require("user.lsp.settings.pyright")
    require("lspconfig").pyright.setup(
      vim.tbl_deep_extend("force", pyright_opts, opts)
    )
  end,
  ["rust_analyzer"] = function()
    --[[ local rust_analyzer_opts = require("user.lsp.settings.rust_analyzer") ]]
    --[[ require("lspconfig").rust_analyzer.setup( ]]
    --[[   vim.tbl_deep_extend("force", rust_analyzer_opts, opts) ]]
    --[[ ) ]]
    require("user.dap.settings.rust")
    rt.setup({
      server = {
        on_attach = function(client, bufnr)
          lsp_on_attach(client,bufnr)
          dap_on_attach(client, bufnr)
        end,
        capabilities = lsp_capabilities,
        standalone = false,
      },
      dap = dap_dap,
    })
  end,
})
