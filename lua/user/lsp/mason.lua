local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup({
    ui = {
        border = "double",
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

local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities
}

mason_lspconfig.setup_handlers({
    function (server_name)
        require("lspconfig")[server_name].setup(opts)
    end,
	["sumneko_lua"] = function ()
		local sumneko_lua_opts = require("user.lsp.settings.sumneko_lua");
		require("lspconfig").sumneko_lua.setup(
			vim.tbl_deep_extend("force", sumneko_lua_opts, opts)
		)
	end,
	["tsserver"] = function ()
		local tsserver_opts = require("user.lsp.settings.tsserver")
		require("lspconfig").tsserver.setup(
			vim.tbl_deep_extend("force", tsserver_opts, opts)
		)
	end
    --[[ ["rust_analyzer"] = function ()  ]]
    --[[     require("rust-tools").setup {} ]]
    --[[ end ]]
})
