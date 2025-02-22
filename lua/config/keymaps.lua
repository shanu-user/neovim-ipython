-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Send selected code to REPL
vim.keymap.set("v", "<leader>sc", function()
  require("iron.core").visual_send()
end, { desc = "Send selected code to REPL" })

-- Send the current line to REPL
vim.keymap.set("n", "<leader>sl", function()
  require("iron.core").send_line()
end, { desc = "Send current line to REPL" })

-- Open/Attach REPL
vim.keymap.set("n", "<leader>so", function()
  require("iron.core").repl_here()
end, { desc = "Open REPL" })

-- Close REPL
vim.keymap.set("n", "<leader>sq", function()
  require("iron.core").repl_close()
end, { desc = "Close REPL" })

-- Debugging keymaps
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { desc = "Continue debugging" })
vim.keymap.set("n", "<leader>ds", ":lua require'dap'.step_over()<CR>", { desc = "Step over" })
vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>", { desc = "Step into" })

-- Telescope for searching
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })

-- Open a terminal for viewing plots interactively
vim.keymap.set(
  "n",
  "<leader>tp",
  ":vsplit | terminal bash -c 'ipython --matplotlib=qt -i -c \"import matplotlib.pyplot as plt; plt.ion()\"'<CR>",
  { desc = "Open IPython with Qt backend in a vertical split" }
)

-- Refresh a plot display
vim.keymap.set("n", "<leader>rp", function()
  vim.cmd("!python refresh_plot.py")
end, { desc = "Refresh plot display" })
