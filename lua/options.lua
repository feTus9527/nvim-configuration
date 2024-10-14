local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.cursorline = true

opt.termguicolors = true
opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

opt.ignorecase = true
opt.smartcase = true

opt.mouse:append("a")
opt.clipboard:append("unnamedplus")

opt.swapfile = false

opt.autoread = true
vim.bo.autoread = true

-- hightlight copied text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300,
    })
  end,
})
