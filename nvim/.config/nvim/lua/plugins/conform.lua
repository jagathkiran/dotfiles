return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Always}",
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Always}" },
        },
        prettier = {
          prepend_args = { "--tab-width=4", "--use-tabs" },
        },
      },
    },
  },
}
