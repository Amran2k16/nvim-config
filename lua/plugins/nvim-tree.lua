return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
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
    end,
}
