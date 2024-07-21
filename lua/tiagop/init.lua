-- disable netrw -> using nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- 24 bit color
vim.opt.termguicolors = true

require("tiagop.set")
require("tiagop.remap")
require("tiagop.packer")
