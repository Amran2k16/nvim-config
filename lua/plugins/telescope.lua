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
        {
            "<leader>f/",
            function()
                builtin.live_grep({ search_dirs = { vim.fn.expand("%:p") }, prompt_title = "Grep Current File" })
            end,
            desc = "Grep current file",
        },
    },
}
