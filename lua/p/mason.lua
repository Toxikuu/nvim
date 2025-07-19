return {
    "mason-org/mason.nvim",
    opts = {
        ensure_installed = {
            "prettierd",
            "shfmt",
            "shellcheck",
            "rust-analyzer",
            "tinymist",
            "clangd",
        },

        ui = {
            icons = {
                package_installed = "*",
                package_pending = "-",
                package_uninstalled = "x"
            },
        },
    },
}
