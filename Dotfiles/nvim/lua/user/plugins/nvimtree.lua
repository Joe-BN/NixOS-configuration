return {
    --Nvim Tree
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    }, 
    config = function()
        local nvimtree = require("nvim-tree")

        --Recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        --change color for arows in tree to light blue
        vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

        --configuring nvim-tree
        nvimtree.setup({
            view = {
                width = 30,
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            },

            --flder arrow icons
            renderer = {
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = ">", --arrow when folder is closed
                            arrow_open = "󱞩", --arrow when the folder is open
                        },
                    },
                },
            },
            
            -- disable window_picker for explorer to work well with window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
        })
    
    -- set keymaps
    local keymap = vim.keymap -- for concisness

    keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>") --Toggle file explorer
    keymap.set("n", "<leader>ft", "<cmd>NvimTreeFindFileToggle<CR>") --look for a file location
    keymap.set("n", "<leader>ct", "<cmd>NvimTreeCollapse<CR>") --collapse file explorer
    keymap.set("n", "<leader>rt", "<cmd>NvimTreeRefresh<>CR") --refresh file explorer

    end,
}
