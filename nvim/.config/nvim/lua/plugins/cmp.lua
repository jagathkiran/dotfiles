return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- Extend the default keymap with custom mappings
    opts.keymap = vim.tbl_deep_extend("force", opts.keymap or {}, {
      ["<CR>"] = { "fallback" }, -- Insert newline without confirming completion
      ["<Tab>"] = {
        "accept", -- Accept completion if menu is open
        fallback = function()
          vim.api.nvim_feedkeys("\t", "n", false) -- Insert literal tab character (or spaces with expandtab)
        end,
        "fallback",
      },
      ["<S-Tab>"] = {
        "snippet_forward", -- Jump forward in snippet
        "select_next", -- Select previous completion item if menu is open
        fallback = function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false) -- Default <S-Tab> behavior
        end,
      },
      ["<C-Space>"] = { "show" },
      ["<C-e>"] = { "cancel" }, -- Close the completion menu
    })
    return opts
  end,
}
