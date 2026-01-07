-- <leader> c opens change shortcuts
-- <leader> v opens visual shortcuts
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = { "<leader>", "<c-w>" },
    config = function()
        require("which-key").setup({
            plugins = {
                presets = {
                    windows = true,
                },
            },
        })
    end,
}
