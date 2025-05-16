-- plugins/noice.lua
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        views = {
            notify = {
                backend = "notify"
            }
        },
    }
}
