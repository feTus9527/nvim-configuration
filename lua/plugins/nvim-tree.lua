return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      local api = require("nvim-tree.api")
      vim.keymap.set("n", "<leader>e", api.tree.toggle)

      local function custom_on_attach(bufnr)
        local function opts(desc)
          return {
            desc = "nvim-tree:" .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "<leader>e", api.tree.toggle, opts("Toggle"))
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      end

      require("nvim-tree").setup({
        on_attach = custom_on_attach,
        filters = {
          custom = { "^.git$" },
        },
        actions = {
          open_file = { quit_on_open = true },
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        git = {
          enable = true,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
        },
      })
    end,
  },
}
