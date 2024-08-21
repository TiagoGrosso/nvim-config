--Basic stuff
vim.keymap.set("n", "Y", "yy")
-- Not using netrw, using nvim-tree
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- nvim-tree remaps
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>NvimTreeFindFile<CR>")
vim.keymap.set("n", "<C-t>", "<cmd>NvimTreeFocus<CR>")
vim.keymap.set("n", "<C-c>", "<cmd>NvimTreeCollapse<CR>")

-- Move selected text move and down + auto indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place on line merge
vim.keymap.set("n", "J", "mzJ`z")

-- Center cursor after half screen move up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center cursor after search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When leader+pasting in visual mode, don't replace register contents
vim.keymap.set("x", "<leader>p", '"_dp')

-- leader+delete uses the void register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- neotest
vim.keymap.set("n", "<leader>r", ":lua require('neotest').run.run()<cr>")
vim.keymap.set("n", "<leader><c-s>", ":lua require('neotest').run.stop()<cr>")
vim.keymap.set("n", "<leader><c-a>", ":lua require('neotest').run.attach()<cr>")
vim.keymap.set("n", "<leader>R", ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>")
vim.keymap.set("n", "<leader><c-r>", ":lua require('neotest').run.run({strategy = 'dap'})<cr>")
vim.keymap.set("n", "<leader>O", ":lua require('neotest').output.open({enter = true})<CR>")
vim.keymap.set("n", "<leader>o", ":lua require('neotest').output_panel.toggle()<CR>")
vim.keymap.set("n", "<leader>s", ":lua require('neotest').summary.toggle()<CR>")

-- barbar
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>")
-- Goto buffer in position...
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>")
-- Pin/unpin buffer
vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>")
-- Close buffer
vim.keymap.set("n", "<A-w>", "<Cmd>BufferClose<CR>")
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
vim.keymap.set("n", "<A-s>", "<Cmd>BufferPick<CR>")

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Format file
vim.keymap.set("n", "<C-A-L>", ":lua vim.lsp.buf.format()<CR>")
