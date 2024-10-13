local _opt = vim.opt

_opt.number = true
_opt.relativenumber = true

_opt.tabstop = 2
_opt.shiftwidth = 2
_opt.expandtab = true
_opt.autoindent = true

_opt.cursorline = true
_opt.termguicolors = true

_opt.scrolloff = 5
_opt.sidescrolloff = 5

_opt.hlsearch = true
_opt.incsearch = true

_opt.ignorecase = true
_opt.smartcase = true

_opt.mouse:append("a")
_opt.clipboard:append("unnamedplus")

_opt.swapfile = false
_opt.autoread = true
vim.bo.autoread = true

-- hightlight copied text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300,
    })
  end
})
