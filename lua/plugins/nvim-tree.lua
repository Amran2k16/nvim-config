return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        {
            "antosha417/nvim-lsp-file-operations",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
        },
    },
    keys = {
        {
            "<c-n>",
            function()
                require("nvim-tree.api").tree.toggle()
            end,
            desc = "Toggle file tree",
        },
    },
    config = function()
        require("nvim-tree").setup {}
        require("lsp-file-operations").setup()
    end,
}
