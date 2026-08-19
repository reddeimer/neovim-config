return {
    "neovim/nvim-lspconfig",

    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {},
        },
        "mason-org/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",

        -- El plugin de autocompletado añadirá sus capabilities.
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        require("fidget").setup({})

        local capabilities =
            require("cmp_nvim_lsp").default_capabilities()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "vtsls",
                "tailwindcss",
                "basedpyright",
                "ruff",
            },

            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,

                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT",
                                },

                                diagnostics = {
                                    globals = { "vim" },
                                },

                                workspace = {
                                    library = vim.api.nvim_get_runtime_file(
                                        "",
                                        true
                                    ),
                                    checkThirdParty = false,
                                },
                            },
                        },
                    })
                end,

                ["tailwindcss"] = function()
                    require("lspconfig").tailwindcss.setup({
                        capabilities = capabilities,

                        filetypes = {
                            "html",
                            "css",
                            "scss",
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "vue",
                            "svelte",
                            "heex",
                        },
                    })
                end,

                ["zls"] = function()
                    local lspconfig = require("lspconfig")

                    lspconfig.zls.setup({
                        capabilities = capabilities,

                        root_dir = lspconfig.util.root_pattern(
                            ".git",
                            "build.zig",
                            "zls.json"
                        ),

                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })

                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,
            },
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },

            severity_sort = true,
        })
    end,
}
