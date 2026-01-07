local builtin = require("telescope.builtin")

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>ff",
            function()
                builtin.find_files()
            end,
            desc = "Find files",
        },
        {
            "<leader>fg",
            function()
                builtin.live_grep()
            end,
            desc = "Live grep",
        },
    },
}
