return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		version = "v1.0.0",
		config = function()
			local nvim_lsp = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			nvim_lsp.denols.setup({
				on_attach = on_attach,
				root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
				capabilities = capabilities,
			})

			nvim_lsp.ts_ls.setup({
				on_attach = on_attach,
				root_dir = nvim_lsp.util.root_pattern("package.json"),
				single_file_support = false,
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
