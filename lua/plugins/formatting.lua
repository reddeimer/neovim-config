return {
    "stevearc/conform.nvim",

    event = {
        "BufReadPre",
        "BufNewFile",
    },

    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_format" },
            rust = { "rustfmt" },
            go = { "gofmt" },

            javascript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = {
                "prettierd",
                "prettier",
                stop_after_first = true,
            },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = {
                "prettierd",
                "prettier",
                stop_after_first = true,
            },

            html = { "prettierd", "prettier", stop_after_first = true },
            css = { "prettierd", "prettier", stop_after_first = true },
        },

        format_on_save = {
            timeout_ms = 1000,
            lsp_format = "fallback",
        },
    },
}
