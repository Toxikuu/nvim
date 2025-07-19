return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "css",
                "diff",
                "gitignore",
                "go",
                "html",
                "http",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "rust",
                "sql",
                "toml",
                "vim",
                "yaml",
            },
        },
    },

    {
        "nvim-treesitter/playground",
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = false,
    },
}
