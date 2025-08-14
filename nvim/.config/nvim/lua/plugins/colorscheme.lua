return {
  -- Add midnight.nvim plugin
  { "tiagovla/tokyodark.nvim" },

  -- Configure LazyVim to load midnight
  {
    "LazyVim/LazyVim",
    opts = {
      background = "dark",
      colorscheme = "tokyodark",
    },
  },
}
