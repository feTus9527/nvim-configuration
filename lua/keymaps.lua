vim.g.mapleader = " "

local _keymap = vim.keymap

local opt = {
  noremap = true,
  expr = true,
}

_keymap.set("n", "<c-a>", "ggVG")             -- select all
_keymap.set({ "n", "x" }, "<leader>p", "0p")  -- only copy manually copied text, not deleted text

_keymap.set("n", "<leader>q", "<cmd>q<cr>")   -- :q
_keymap.set("n", "<leader>w", "<cmd>w<cr>")   -- :w
_keymap.set("n", "<leader>x", "<cmd>x<cr>")   -- :x

_keymap.set("n", "j", [[v:count ? "j" : "gj"]], opt)
_keymap.set("n", "k", [[v:count ? "k" : "gk"]], opt)
