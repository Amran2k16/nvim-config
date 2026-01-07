-- My own shortcuts and overrides

vim.keymap.set("n", "<leader>e", function()
    require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle file tree" })
