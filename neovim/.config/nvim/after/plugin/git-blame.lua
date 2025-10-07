vim.g.gitblame_enabled = 1
vim.g.gitblame_message_template = "       <author> • <summary>"
vim.g.gitblame_delay = 0
vim.g.gitblame_message_when_not_committed = ""
vim.g.gitblame_date_format = "%Y-%m-%d %H:%M"
vim.g.gitblame_virtual_text_column = 100

vim.keymap.set("n", "<leader>gb", vim.cmd.GitBlameToggle, { desc = "Toggle git blame" })
