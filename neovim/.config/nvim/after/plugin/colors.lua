function ColorUpdate(color)
    local new_color = color or "catppuccin-frappe"
    vim.cmd.colorscheme(new_color)
end

ColorUpdate()
