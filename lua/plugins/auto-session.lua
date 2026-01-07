return {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
        require("auto-session").setup({
            auto_restore = true,
            suppressed_dirs = { vim.fn.stdpath("data"), vim.fn.stdpath("state"), vim.fn.stdpath("cache") },
        })
    end,
}
