return {

    "neovim/nvim-lspconfig",
    dependencies = {
        "mason.nvim",
        {
            "mason-org/mason-lspconfig.nvim", config = function() end
        },
    },

    config = function()
        -- Diagnostic keymaps
        local opts = { noremap = true, silent = true }
        local map = vim.keymap.set
        map("n", "<leader>dg", vim.diagnostic.open_float, opts)
        map("n", "<leader>dq", vim.diagnostic.setloclist, opts)

        vim.lsp.enable({
            -- "bashls",
            "clangd",
            "lua_ls",
            "rust_analyzer",
            "tinymist",
        })

        vim.diagnostic.config({
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
            float = {
                focusable = true,
                style = "minimal",
                source = true,
                header = "",
                prefix = "",
            },
        })

        vim.filetype.add({
            pattern = {
                [".*/p/.*/config"] = "toml",
            }
        })

        vim.lsp.config("*", {
            capabilities = {
                textDocument = {
                    semanticTokens = {
                        multilineTokenSupport = true,
                    }
                },
                workspace = {
                    fileOperations = {
                        didRename = true,
                        willRename = true,
                    },
                },
            },
            root_markers = {
                ".git",
            },
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = {
                            "vim",
                            "require",
                        },
                    },
                    workspace = {
                        -- make the server aware of neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        vim.lsp.config("tinymist", {
            settings = {
                exportPdf = "never",
            },
        })

        -- vim.lsp.config("bashls", {
        --     cmd = {
        --         "bash-language-server",
        --         "start",
        --     },
        --     filetypes = { "bash", "sh" },
        -- })

        vim.lsp.config("clangd", {
            root_markers = {
                "compile_commands.json",
                "compile_flags.txt",
                "Makefile",
                "configure.ac",
                "configure.in",
                "config.h.in",
                "meson.build",
                "meson_options.txt",
                "build.ninja",
            },

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
        })

        vim.lsp.config("rust_analyzer", {
            settings = {
                ["rust-analyzer"] = {
                    check = {
                        command = "clippy",
                    },

                    imports = {
                        granularity = {
                            group = "module"
                        },
                        prefix = "self",
                    },
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                    },
                    procMacro = {
                        enable = true,
                    },
                    diagnostics = {
                        experimental = {
                            enable = true,
                        },
                    },
                },
            },
        })

    end,
}
