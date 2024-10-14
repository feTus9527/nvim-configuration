vim.g.mapleader = " "

local keymap = vim.keymap

local opt = {
  noremap = true,
  expr = true,
}

keymap.set("n", "<c-a>", "ggVG") -- select all
keymap.set({ "n", "x" }, "<leader>p", "0p") -- only copy manually copied text, not deleted text

keymap.set("n", "<leader>q", "<cmd>q<cr>") -- :q
keymap.set("n", "<leader>w", "<cmd>w<cr>") -- :w
keymap.set("n", "<leader>x", "<cmd>x<cr>") -- :x

keymap.set("n", "j", [[v:count ? "j" : "gj"]], opt)
keymap.set("n", "k", [[v:count ? "k" : "gk"]], opt)
