local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end


local status_ok1, fidget = pcall(require, "fidget")
if not status_ok1 then
	return
end

require("masa.plugins.lsp.lsp-installer")
require("masa.plugins.lsp.handlers").setup()
require("masa.plugins.lsp.null-ls")
fidget.setup({})

require("user.lsp.clangd")

-- this is for the fix of clangd otherwise it keeps giving some error
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })
