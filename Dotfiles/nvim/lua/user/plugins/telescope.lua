return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            enabled = true
        }, 
        {
            "nvim-telescope/telescope-file-browser.nvim",
            enabled = true
        }
    },

    config = function()

    local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        vim.keymap.set("n", "<leader>ff", ":Telescope file_browser<CR>")

    end,

}
