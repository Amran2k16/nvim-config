return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                theme = "ivy",
            },
        })
    end,
    keys = {
        {
            "<leader>f",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find files",
        },
        {
            "<leader>g",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Live grep",
        },
        {
            "<leader>/",
            function()
                require("telescope.builtin").live_grep({ search_dirs = { vim.fn.expand("%:p") }, prompt_title = "Grep Current File" })
            end,
            desc = "Grep current file",
        },
    },
}
