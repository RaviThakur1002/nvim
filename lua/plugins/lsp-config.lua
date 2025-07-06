return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        -- Bootstrap Mason and ensure servers
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "emmet_ls" },
            automatic_installation = true,
        })

        -- Common capabilities for completion
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        -- Diagnostic signs
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- LSP server configurations
        -- Lua
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    completion = { callSnippet = "Replace" },
                },
            },
        })

        -- Emmet
        vim.lsp.config("emmet_ls", {
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })

        -- Default handler for other servers
        local default_opts = { capabilities = capabilities }
        for _, server in ipairs({
            -- add other servers here as needed
            "pyright", "tsserver", "gopls", "clangd",
        }) do
            vim.lsp.config(server, default_opts)
        end

        -- Keymaps on LspAttach
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local buf = ev.buf
                local km = vim.keymap.set
                local opts = { buffer = buf, silent = true }

                km("n", "gR", "<cmd>Telescope lsp_references<CR>",
                    vim.tbl_extend("force", opts, { desc = "Show LSP references" }))
                km("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
                km("n", "gd", "<cmd>Telescope lsp_definitions<CR>",
                    vim.tbl_extend("force", opts, { desc = "Show LSP definitions" }))
                km("n", "gi", "<cmd>Telescope lsp_implementations<CR>",
                    vim.tbl_extend("force", opts, { desc = "Show LSP implementations" }))
                km("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>",
                    vim.tbl_extend("force", opts, { desc = "Show LSP type definitions" }))
                km({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
                    vim.tbl_extend("force", opts, { desc = "See available code actions" }))
                km("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Smart rename" }))
                km("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>",
                    vim.tbl_extend("force", opts, { desc = "Show buffer diagnostics" }))
                km("n", "<leader>d", vim.diagnostic.open_float,
                    vim.tbl_extend("force", opts, { desc = "Show line diagnostics" }))
                km("n", "[d", vim.diagnostic.goto_prev, opts)
                km("n", "]d", vim.diagnostic.goto_next, opts)
                km("n", "K", vim.lsp.buf.hover,
                    vim.tbl_extend("force", opts, { desc = "Show documentation under cursor" }))
                km("n", "<leader>rs", ":LspRestart<CR>", opts)
            end,
        })
    end,
}
