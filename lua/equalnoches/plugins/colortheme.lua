return {
	-- "catppuccin/nvim",
	-- "neanias/everforest-nvim",
	-- "shatur/neovim-ayu",
	"sainnhe/gruvbox-material",
	-- "ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
        vim.g.gruvbox_material_enable_bold = true
        vim.g.gruvbox_material_transparent_background = true
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_enable_italic = true
		vim.cmd([[colorscheme gruvbox-material]])
	end,
}
