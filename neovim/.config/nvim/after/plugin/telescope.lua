local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pt', builtin.lsp_dynamic_workspace_symbols, {})
local actions = require("telescope.actions")

require("telescope").setup({
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    },
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
})
