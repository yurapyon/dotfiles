function hide_semantic_hl()
  vim.api.nvim_set_hl(0, "@lsp.type.function", {})

  for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
  end
end

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    vim.lsp.enable("rust_analyzer")
    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          check = {
            command = "clippy",
          },
        },
      },
    })

    local severity = vim.diagnostic.severity

    vim.diagnostic.config({
      virtual_text = false,
      signs = {
        text = {
          [severity.ERROR] = "E>",
          [severity.WARN] = "W>",
          [severity.INFO] = "i ",
          [severity.HINT] = "h ",
        },
      },
      -- update_in_insert = true,
      underline = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    hide_semantic_hl()

    vim.cmd([[
      set signcolumn=yes
      " set ut=3000
      " autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
    ]])
  end,
}
