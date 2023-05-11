-- Move selected code up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append next line to current one but keep the cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Allow page jumping to keep cursor position
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- New tab and close tab
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew)
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep copied buffer when pasting
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", vim.cmd.Neoformat)

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--
-- Open explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<leader>pw", vim.cmd.NvimTreeToggle)

-- Quickfix
local function quickfix()
    vim.lsp.buf.code_action({
    })
end

vim.keymap.set('n', '<leader>qf', quickfix, { noremap = true, silent = true })
