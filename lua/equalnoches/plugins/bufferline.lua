return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		-- Bufferline setup
		require("bufferline").setup({
			options = {
				-- Adjust offset for Neo-tree integration
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
				diagnostics = "nvim_lsp", -- Show LSP indicators
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				show_buffer_close_icons = false,
				show_close_icon = false,
				separator_style = "slant",
				always_show_bufferline = true,
			},
			highlights = {
				buffer_selected = {
					fg = "#ffffff",
					underline = true, -- Add underline to the selected buffer
				},
			},
		})

		-- Keymaps for navigating buffers
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", opts) -- Next buffer
		vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", opts) -- Previous buffer
	end,
}
