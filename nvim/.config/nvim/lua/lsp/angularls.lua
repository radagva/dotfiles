local on_attach = function(_, _)
	require("lspconfig").angularls.setup({})
end

return {
	on_attach = on_attach,
	filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
}
