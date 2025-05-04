return{
    {
        --Treesitter
        "nvim-treesitter/nvim-treesitter",
        priority = 999, --loading it after theme
        config = function()
            require("nvim-treesitter.configs").setup ({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "python", "sql", "html",
                                    "css", "gdscript", "cpp", "go", "javascript"},
                auto_install = true,
                highlight = {
                    enable = true,
                },
                increment_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>ss",
                        node_incrementnl = "<leader>si",
                        scope_incremental = "<leader>sc",
                        node_decremental = "<leader>sd",
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    }
}
