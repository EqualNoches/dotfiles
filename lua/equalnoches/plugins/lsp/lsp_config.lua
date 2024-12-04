return {
	"neovim/nvim-lspconfig",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		inlay_hints = { enabled = true },
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lsp = require("lspconfig")
		local keymap = vim.keymap

		local on_attach = function(_, buf)
			local opts = { noremap = true, silent = true, buffer = buf }
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			keymap.set("n", "<C-Space>", vim.lsp.buf.code_action, opts)
			keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
			keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
			keymap.set("n", "<C-p>", vim.lsp.buf.signature_help, opts)
			keymap.set("n", "<C-f>", vim.lsp.buf.format)

			keymap.set("n", "]g", vim.diagnostic.goto_next)
			keymap.set("n", "[g", vim.diagnostic.goto_prev)

			vim.lsp.inlay_hint.enable(true)
			vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#9DA9A0" })
			-- Setup autoformatting on buffer write
			-- vim.cmd [[ autocmd BufWritePre <buffer> lua vim.lsp.buf.format() ]]
		end

		local caps = require("cmp_nvim_lsp").default_capabilities()

		lsp["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lsp["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lsp["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lsp["omnisharp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lsp["csharp_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lsp["dartls"].setup({
			capabilities = capabilities,
			cmd = {
				"dart",
				"language-server",
				"--protocol=lsp",
			},
			on_attach = on_attach,
		})

		lsp["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
