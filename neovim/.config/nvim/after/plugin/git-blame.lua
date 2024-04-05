vim.g.gitblame_enabled = 1
vim.g.gitblame_message_template = "       <author>, <date> • <summary>"
vim.g.gitblame_delay = 300
vim.g.gitblame_message_when_not_committed = "       <author>, <date> • Uncommitted changes"
vim.g.gitblame_date_format = "%Y-%m-%d %H:%M"

vim.keymap.set("n", "<leader>gb", vim.cmd.GitBlameToggle, { desc = "Toggle git blame" })
