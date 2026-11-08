return {
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedarkpro").setup({
        caching = false,
        colors = { onedark = { bg = "#16181d" } },
      })
      vim.cmd.colorscheme("onedark")
    end,
  },
}
