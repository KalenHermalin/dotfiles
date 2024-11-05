return {
	"dmmulroy/tsc.nvim",

	dependencies = { "rcarriga/nvim-notify" },
	config = function()
		require("tsc").setup({
			flags = { watch = true },
			use_diagnostics = false,
		})
	end,
}
