return {
  {
    "coffebar/neovim-project",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "Shatur/neovim-session-manager",
    },
    lazy = false,
    priority = 1000,
    opts = {
      projects = {
        "D:/fetus-workspace/frontend/*",
        "D:/sino-workspace/crx/*",
        vim.fn.stdpath("config"),
      },
    },
    init = function()
      vim.opt.sessionoptions:append("globals")
    end,
  },
}
