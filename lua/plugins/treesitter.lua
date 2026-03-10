return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		 require("nvim-treesitter").setup({
			ensure_installed = {
                "gcc",
				"rust",
				"help",
				"lua",
				"python",
				"javascript",
				"typescript",
				"html",
				"css",
				"bash",
				"json",
			},
			auto_install = true,
			highlight = {
				enable = true
			},
			indent = {
				enable = true,
			},
		})
	end,
}

