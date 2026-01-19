return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
        -- mason-lspconfig expects newer mason.nvim APIs; add compatibility shims.
        do
            local registry = require("mason-registry")
            if not registry.__lspconfig_refresh_compat then
                registry.__lspconfig_refresh_compat = true
                local original_refresh = registry.refresh
                registry.refresh = function(cb)
                    if not cb then
                        return original_refresh()
                    end
                    return original_refresh(function()
                        cb(true, {})
                    end)
                end
            end

            local Package = require("mason-core.package")
            if not Package.is_installing then
                function Package:is_installing()
                    return self:get_handle()
                        :map(function(handle)
                            return not handle:is_closed() and not handle:is_idle()
                        end)
                        :or_else(false)
                end
            end
        end

        require("mason-lspconfig").setup({
            ensure_installed = { "ts_ls", "biome" },
            automatic_installation = true,
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config("ts_ls", {
            on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
            capabilities = capabilities,
        })

        vim.lsp.config("biome", {
            capabilities = capabilities,
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "json",
                "jsonc",
            },
        })

        vim.lsp.enable("ts_ls")
        vim.lsp.enable("biome")

        vim.diagnostic.config({
            virtual_text = true,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = { buffer = event.buf, silent = true }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            end,
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name == "biome"
                    end,
                })
            end,
        })
    end,
}
