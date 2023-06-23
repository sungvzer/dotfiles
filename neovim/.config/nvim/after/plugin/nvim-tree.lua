require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 50,
        side = 'right',
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
        git_clean = false
    },
    git = {
        ignore = false
    },
    update_focused_file = {
        enable = true
    },
})
