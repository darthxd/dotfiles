return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
        ensure_installed = {
          "lua-language-server",
          "eslint-lsp",
          "typescript-language-server",
          "tailwindcss-language-server",
          "pylsp",
          "html-lsp",
          "gopls",
        },
      })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "jdtls" },
			})
		end,
	},
   	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
            local configs = require("lspconfig.configs")
			local util = require("lspconfig/util")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- JetBrains Kotlin LSP
            configs.kotlin_lsp = {
                default_config = {
                    cmd = { "kotlin-lsp", "--stdio" },
                    single_file_support = true,
                    filetypes = { "kotlin" },
                    root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
                }
            }

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.eslint.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.omnisharp.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
            lspconfig.kotlin_lsp.setup({capabilities = capabilities})
			lspconfig.jdtls.setup({
                cmd = {"jdtls","--jvm-arg=-javaagent:/home/gabrieldarth/.java/lombok.jar"},
                capabilities = capabilities,
            })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.emmet_language_server.setup({ capabilities = capabilities })
			lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				single_file_support = true,
				capabilities = capabilities,
				settings = {
					gopls = {
						completeUnimported = true,
					},
				},
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
