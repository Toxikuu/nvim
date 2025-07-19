return {

    "neovim/nvim-lspconfig",
    dependencies = {
        "mason.nvim",
        {
            "mason-org/mason-lspconfig.nvim", config = function() end
        },
    },

    opts = function()
        local ret = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "-",
                },
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "!",
                        [vim.diagnostic.severity.WARN]  = "?",
                        [vim.diagnostic.severity.HINT]  = "+",
                        [vim.diagnostic.severity.INFO]  = "-",
                    },
                },
            },

            inlay_hints = {
                enabled = false,
            },

            codelens = {
                enabled = false,
            },

            capabilities = {
                workspace = {
                    fileOperations = {
                        didRename = true,
                        willRename = true,
                    },
                },
            },

            servers = {
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            check = {
                                command = "clippy",
                            },
                        },
                    },
                },
                tinymist = {
                    settings = {
                        exportPdf = "never",
                    },
                },
                -- shellcheck = {
                --     settings = {
                --
                --     },
                -- },
                clangd = {
                    root_dir = function(fname)
                        return require("lspconfig.util").root_pattern(
                            "Makefile",
                            "configure.ac",
                            "configure.in",
                            "config.h.in",
                            "meson.build",
                            "meson_options.txt",
                            "build.ninja"
                        )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
                            fname
                        ) or require("lspconfig.util").find_git_ancestor(fname)
                    end,
                    capabilities = {
                        offsetEncoding = { "utf-16" },
                    },
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                    },
                    init_options = {
                        usePlaceholders = true,
                        completeUnimported = true,
                        clangdFileStatus = true,
                    },
                },
            },

            setup = {},
        }

        return ret
    end,

    config = function(_, opts)
        -- set borders for lsp popups
        local handlers = vim.lsp.handlers
        handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, {
            border = "single",
        })
        handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, {
            border = "single",
        })

        -- setup lsp
        local lspconfig = require("lspconfig")

        -- setup diagnostics
        vim.diagnostic.config(opts.diagnostics)
        if opts.diagnostics and opts.diagnostics.signs and opts.diagnostics.signs.text then
            for severity, icon in pairs(opts.diagnostics.signs.text) do
                local name = "DiagnosticSign" .. ({
                    [vim.diagnostic.severity.ERROR] = "Error",
                    [vim.diagnostic.severity.WARN]  = "Warn",
                    [vim.diagnostic.severity.INFO]  = "Info",
                    [vim.diagnostic.severity.HINT]  = "Hint",
                })[severity]
                vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
            end
        end

        -- setup servers
        for server, server_opts in pairs(opts.servers or {}) do
            local setup = opts.setup[server] or function() return false end
            if not setup(server, server_opts) then
                lspconfig[server].setup(server_opts)
            end
        end
    end,
}
