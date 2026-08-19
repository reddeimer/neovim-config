return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
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
                "tsx",
                "html",
                "css",
                "bash",
                "json",
                "java",
                "python",
                "sql"
            },
            auto_install = true,
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            },
        })
    end,
}
