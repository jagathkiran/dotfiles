return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {},
    config = function()
      -- Your table of languages
      local four_space = {
        "cpp",
        "cc",
        "c",
        "javascript",
        "typescript",
        "json",
        "java",
        "kotlin",
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = four_space,
        callback = function()
          vim.opt_local.shiftwidth = 4
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.expandtab = false
        end,
      })
    end,
  },
}
