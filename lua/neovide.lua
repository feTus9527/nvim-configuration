if vim.g.neovide then
  -- appearance
  vim.g.neovide_transparency = 0.95
  vim.o.guifont = "0xProto Nerd Font Mono"
  vim.g.neovide_cursor_vfx_mode = "ripple"
  vim.g.neovide_remember_window_size = true

  -- MacOS only
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_transparency = 0.85

  -- scale behavior
  vim.g.neovide_scale_factor = 1.0

  -- dynamic scale
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.1)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.1)
  end)

  vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<C-c>", '"+y') -- Copy
  vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode

  -- Allow clipboard copy paste in neovim
  vim.api.nvim_set_keymap(
    "",
    "<C-v>",
    "+p<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "!",
    "<C-v>",
    "<C-R>+",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "t",
    "<C-v>",
    "<C-R>+",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "v",
    "<C-v>",
    "<C-R>+",
    { noremap = true, silent = true }
  )
end
