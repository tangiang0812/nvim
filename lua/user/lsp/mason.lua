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

local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
}

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
    require("rust-tools").setup({
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
      },
      dap = require("user.lsp.settings.rust")
    })
  end,
})
