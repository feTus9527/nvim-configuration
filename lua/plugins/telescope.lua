return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")

      local keymap = vim.keymap
      keymap.set("n", "<leader>f", builtin.find_files, {})
      keymap.set("n", "<leader>g", builtin.live_grep, {})

      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["esc"] = actions.close,
            },
          },
          file_ignore_patterns = {
            "^.git/",
            "lazy-lock.json",
            "node_modules",
            "yarn.lock",
            "pnpm-lock.yaml",
            "package-lock.json",
          },
          dynamic_preview_title = true,
          path_display = { "smart" },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        layout_config = {
          horizontal = { preview_cutoff = 100, preview_width = 0.5 },
        },
        extensions = {},
      })
    end,
  },
}
