return {
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next()
      end, { desc = "Next TODO comment" })

      vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev()
      end, { desc = "Previous TODO comment" })

      vim.keymap.set(
        "n",
        "<leader>t",
        "<cmd>TodoTelescope<cr>",
        { desc = "Previous TODO comment" }
      )
      require("todo-comments").setup({})
    end,
  },
}
