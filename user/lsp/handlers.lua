local M = {}
local keymap = vim.keymap.set

local cmp_nvim_lsp = require "cmp_nvim_lsp"

-- M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities.offsetEncoding = { "utf-16" }
-- M.capabilities.textDocument.completion.completionItem.snippetSupport = true
-- M.capabilities = cmp_nvim_lsp.default_capabilities()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
return M
