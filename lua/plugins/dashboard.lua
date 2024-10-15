return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local p = vim.fn.getcwd()
      local banner_path = p .. "/AppData/Local/nvim/banner.txt"

      local banner = {}
      local file = io.open(banner_path, "r")
      if file then
        for line in file:lines() do
          table.insert(banner, line)
        end
        file:close()
        print("Banner file read successfully")
      else
        print("Cannot open banner file " .. banner_path)
        banner = { "Default header", "when file cannot be read" }
      end
      require("dashboard").setup({
        config = {
          header = banner,
        },
      })
    end,
  },
}

