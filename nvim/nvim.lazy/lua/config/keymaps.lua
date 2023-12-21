-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
vim.keymap.set("n", "<c-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true, remap = false })
vim.keymap.set("n", "<c-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true, remap = false })
vim.keymap.set("n", "<c-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true, remap = false })
vim.keymap.set("n", "<c-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true, remap = false })
vim.keymap.set("n", "<c-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true, remap = false })
vim.keymap.set("n", "<c-space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true, remap = false })
vim.keymap.set("n", "<up>", ":<up>")
vim.keymap.set("n", "<c-o>", "<c-o>zz", { noremap = true })
vim.keymap.set("n", "<c-i>", "<c-i>zz", { noremap = true })
vim.keymap.set("n", "<c-n>i", "<c-i>zz", { remap = false })
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("n", "q", "<c-w>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<localleader>w", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set("n", "<space>", "<c-d>zz", { remap = false })
vim.keymap.set("n", "<s-space>", "<c-u>zz", { remap = false })
vim.keymap.set("n", "<bs>", ":b#<cr>", { silent = true })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "g;", "g;zz")
vim.keymap.set("n", "g,", "g,zz")
vim.keymap.set("n", "go", "o<esc>O")
vim.keymap.set("n", "<leader>o", "o<esc>", { noremap = true })
vim.keymap.set("n", "so", ":only<cr>", { silent = true })
vim.keymap.set("n", "ch", ":%s///g<left><left>")
vim.keymap.set("v", "ch", ":s///g<left><left>")
vim.keymap.set("n", "*", ":execute 'normal! *N'<cr>", { silent = true })
vim.keymap.set("n", "cm", ":execute 'normal! *N'<cr>:%s///g<left><left>")
vim.keymap.set("n", "<tab>", ":tabnext<cr>", { silent = true })
vim.keymap.set("n", "<s-tab>", ":tabprev<cr>", { silent = true })
vim.keymap.set("n", "sg", ":sp<cr>", { silent = true })
vim.keymap.set("n", "sv", ":vs<cr>", { silent = true })
vim.keymap.set("n", "ssg", ":vs | b#<cr>", { silent = true })
vim.keymap.set("n", "<cr>", "za")
vim.keymap.set("i", "<c-bs>", "<c-w>", { noremap = true })
vim.keymap.set("i", "<c-h>", "<c-w>", { noremap = true })
-- vim.keymap.set({ "n", "v" }, "<localleader>a<esc>", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<localleader>a", "<leader>ca", { desc = "Code Action", remap = true })
vim.keymap.set("n", "<localleader>s", "<leader>cA", { desc = "Source Action", remap = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>e",
  ":Telescope file_browser theme=get_ivy hide_parent_dir=true display_stat=false<CR><Esc>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>a",
  ":Telescope file_browser path=%:p:h select_buffer=true theme=get_ivy hide_parent_dir=true display_stat=false<CR><Esc>",
  { noremap = true, silent = true }
)

-- vim.keymap.set(
--   "n",
--   "<leader>gs",
--   "<Nop>",
--   { remap = false, desc = "When grep search for words starting with s it shows git status :/" }
-- )
