function ColorUpdate(color)
    local new_color = color or "everforest"
    vim.cmd.colorscheme(new_color)
    vim.g.everforest_background = "hard"
    vim.g.everforest_better_performance = 1
end

ColorUpdate()
-- require('everblush').setup({
--    transparent_background = false.
-- })
