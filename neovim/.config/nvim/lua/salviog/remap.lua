-- Move selected code up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected code down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected code up" })

-- Append next line to current one but keep the cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Allow page jumping to keep cursor position
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- New tab and close tab
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew, { desc = "New tab" })

-- Keep copied buffer when pasting
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without emptying buffer in visual" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

vim.keymap.set("n", "<leader>f", vim.cmd.Neoformat, { desc = "Format code with Neoformat" })

-- Replace current word
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace current word everywhere in file" }
)
--
-- Open explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus, { desc = "Focus file explorer" })
vim.keymap.set("n", "<leader>pw", vim.cmd.NvimTreeToggle, { desc = "Toggle file explorer" })

-- Quickfix
local function quickfix()
	vim.lsp.buf.code_action({})
end

vim.keymap.set("n", "<leader>qf", quickfix, { noremap = true, silent = true, desc = "Quickfix LSP" })

-- Create a 10-line tall terminal split
vim.keymap.set("n", "<leader>T", "<C-w>s<C-w>j10<C-w>_:term<CR>i", { desc = "Open terminal split" })

-- LazyGit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })

-- Navbuddy
vim.keymap.set("n", "<leader>nb", ":Navbuddy<CR>", { desc = "Open Navbuddy" })
