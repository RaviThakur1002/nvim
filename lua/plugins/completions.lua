return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "petertriho/cmp-git",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "windwp/nvim-autopairs",
        "onsails/lspkind-nvim",
        "roobert/tailwindcss-colorizer-cmp.nvim",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        "rafamadriz/friendly-snippets",
        "mlaursen/vim-react-snippets",
    },

    config = function()
        local cmp = require("cmp")
        local lsp_kind = require("lspkind")

        -- Load VSCode style snippets (friendly-snippets + vim-react-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        lsp_kind.init()

        local formatting_style = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, item)
                local icon = lsp_kind.presets.default[item.kind] or ""
                icon = " " .. icon .. " "

                local lspkind_text = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[snp]",
                    buffer = "[buf]",
                    nvim_lua = "[lua]",
                    path = "[path]",
                })[entry.source.name]

                item.menu = lspkind_text and "   (" .. item.kind .. ")" or ""
                item.kind = icon

                return require("tailwindcss-colorizer-cmp").formatter(entry, item)
            end,
        }

        local function too_big(bufnr)
            local max_filesize = 10 * 1024 -- 10 KB
            local check_stats = (vim.uv or vim.loop).fs_stat
            local ok, stats = pcall(check_stats, vim.api.nvim_buf_get_name(bufnr))
            return ok and stats and stats.size > max_filesize
        end

        local preferred_sources = {
            { name = "nvim_lsp_signature_help", group_index = 1 },
            { name = "nvim_lsp", max_item_count = 20, group_index = 1 },
            { name = "luasnip", max_item_count = 5, group_index = 1 },
            { name = "nvim_lua", group_index = 1 },
            { name = "path", group_index = 2 },
        }

        vim.api.nvim_create_autocmd("BufRead", {
            group = vim.api.nvim_create_augroup("CmpBufferDisableGrp", { clear = true }),
            callback = function(ev)
                local sources = vim.list_slice(preferred_sources)
                if not too_big(ev.buf) then
                    table.insert(sources, { name = "buffer", keyword_length = 4 })
                end
                cmp.setup.buffer({
                    sources = cmp.config.sources(sources),
                })
            end,
        })

        local default_sources = vim.list_slice(preferred_sources)
        table.insert(default_sources, { name = "buffer", keyword_length = 4 })

        cmp.setup({
            performance = {
                max_view_entries = 7,
            },
            view = {
                entries = { name = "custom", selection_order = "near_cursor" },
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require("luasnip").expand_or_jumpable() then
                        vim.fn.feedkeys(
                            vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                            ""
                        )
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif require("luasnip").jumpable(-1) then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = formatting_style,
            sources = cmp.config.sources(default_sources),
        })

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "git" },
            }, {
                { name = "buffer" },
            }),
        })

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = { "Man", "!" },
                    },
                },
            }),
        })

        local presentAutopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
        if presentAutopairs then
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
        end
    end,
}
