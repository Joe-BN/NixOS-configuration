return{
    --Theme
    "folke/tokyonight.nvim",
    priority = 1000, --Make sure it's loaded before others
    config = function()
        -- load the cnfig for this function here
        vim.cmd.colorscheme("tokyonight-night")
    end,

}
