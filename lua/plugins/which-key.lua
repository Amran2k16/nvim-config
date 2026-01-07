return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").setup({
            triggers = { "<leader>", "<c-w>" },
        })
    end,
}
