-- My own custom ones unrelated to plugin specific ones
-- "n" means normal mode
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus above window" })
vim.keymap.set("n", "<C-w>z", "<cmd>vsplit #<CR>", { desc = "Vsplit alternate buffer" })

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    end,
})

vim.keymap.set("n", "<leader>bf", function()
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "biome"
        end,
    })
end, { desc = "Format with Biome" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<C-o><cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<C-o>", "<C-i>", { desc = "Jump forward" })
vim.keymap.set("n", "<C-i>", "<C-o>", { desc = "Jump backward" })
